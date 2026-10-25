#!/usr/bin/env python3
"""Mirror the official Command: Modern Operations Lua API docs as Markdown.

Source: https://commandlua.github.io/

Usage:
    python3 tools/fetch_cmo_docs.py            # writes docs/reference/ and docs/function-index.md

Requirements: python3 with beautifulsoup4 + lxml, and pandoc on PATH.

The output is plain GitHub-flavoured Markdown so it can be committed, grepped
and read offline. Re-run it whenever the upstream docs change.
"""
import os
import re
import subprocess
import sys
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from datetime import date

from bs4 import BeautifulSoup

BASE = "https://commandlua.github.io/"
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "docs", "reference")
INDEX_OUT = os.path.join(ROOT, "docs", "function-index.md")

# Top-level pages that link to every function page.
SEED_ASSETS = ["Functions.html", "DataTypes.html", "Selectors.html", "Tables.html",
               "Wrappers.html", "Examples.html"]

LINK_RE = re.compile(r'\]\((?:\.\./)?(?:assets/)?([A-Za-z0-9_]+)\.html(#[^) ]*)?( "[^"]*")?\)')


def fetch(url):
    try:
        with urllib.request.urlopen(url, timeout=30) as r:
            return r.read().decode("utf-8", errors="replace")
    except urllib.error.HTTPError as e:
        if e.code == 404:
            return None
        raise


def local_link(href):
    m = re.match(r'(?:\.\./)?(?:assets/)?([A-Za-z0-9_]+)\.html(#\S*)?$', href)
    if not m:
        return href
    name = "Overview" if m.group(1) in ("index", "index2") else m.group(1)
    return name + ".md" + (m.group(2) or "")


def cell_text(cell):
    for br in cell.find_all("br"):
        br.replace_with("\n")
    for blk in cell.find_all(["p", "li", "div"]):
        blk.insert_after("\n")
    for code in cell.find_all("code"):
        code.replace_with("`" + code.get_text() + "`")
    for a in cell.find_all("a"):
        href, txt = local_link(a.get("href", "")), a.get_text().strip()
        a.replace_with(f"[{txt}]({href})" if href and txt else txt)
    text = re.sub(r"[ \t\xa0]+", " ", cell.get_text())
    lines = [ln.strip() for ln in text.split("\n")]
    return "<br>".join(ln for ln in lines if ln).replace("|", "\\|")


def table_md(table):
    rows = []
    for tr in table.find_all("tr"):
        if tr.find_parent("table") is not table:
            continue
        cells = [cell_text(c) for c in tr.find_all(["td", "th"]) if c.find_parent("tr") is tr]
        if cells:
            rows.append(cells)
    if not rows:
        return ""
    n = max(len(r) for r in rows)
    rows = [r + [""] * (n - len(r)) for r in rows]
    lines = ["| " + " | ".join(rows[0]) + " |", "|" + "---|" * n]
    lines += ["| " + " | ".join(r) + " |" for r in rows[1:]]
    return "\n".join(lines)


def html_to_md(html):
    soup = BeautifulSoup(html, "lxml")
    main = soup.find(id="main") or soup.find(id="content") or soup.body
    if main is None:
        return ""
    for n in main.find_all(["script", "style"]):
        n.decompose()
    # Keep upstream element ids as <a name> anchors so "Page.md#id" links work.
    anchors = {}
    for i, el in enumerate(main.find_all(id=True)):
        if el.name in ("table", "tr", "td", "th"):
            continue
        key = f"ANCHORPLACEHOLDER{i}X"
        anchors[key] = f'<a name="{el["id"]}"></a>'
        if not el.get_text().strip():
            el.replace_with(key)
        elif el.name in ("h1", "h2", "h3", "h4", "h5", "h6"):
            el.insert(0, key + " ")
        else:
            el.insert_before(key)
    for sp in main.find_all("span"):
        cls = sp.get("class") or []
        empty = not sp.get_text().strip()
        if "readonly" in cls:
            sp.replace_with(" [READ ONLY] ")
        elif "pro_only" in cls:
            sp.replace_with(" [PRO ONLY] ")
        elif "anchor" in cls and not sp.get("id"):
            sp.decompose()
        elif "print" in cls and empty:   # rendered via CSS ::before on the site
            sp.replace_with("print")
        elif "nil" in cls and empty:
            sp.replace_with("nil")
        else:
            sp.unwrap()
    tables = {}
    for i, tb in enumerate(reversed(main.find_all("table"))):
        key = f"TBLPLACEHOLDER{i}X"
        tables[key] = table_md(tb)
        p = soup.new_tag("p")
        p.string = key
        tb.replace_with(p)
    for d in main.find_all("div"):
        d.unwrap()
    html = re.sub(r"</code>\s*<code>", "", str(main))
    md = subprocess.run(["pandoc", "-f", "html", "-t", "gfm-raw_html", "--wrap=none"],
                        input=html, capture_output=True, text=True, check=True).stdout
    for k, v in tables.items():
        md = md.replace(k, "\n" + v + "\n")
    for k, v in anchors.items():
        md = md.replace(k, v)
    md = LINK_RE.sub(lambda m: "](" + local_link(m.group(1) + ".html" + (m.group(2) or "")) + (m.group(3) or "") + ")", md)
    md = md.replace(r"\[READ ONLY\]", "**[READ ONLY]**").replace(r"\[PRO ONLY\]", "**[PRO ONLY]**")
    md = re.sub(r"\n{3,}", "\n\n", md)
    return md.strip() + "\n"


def asset_links(html):
    return set(re.findall(r'href="(?:\.\./)?(?:assets/)?([A-Za-z0-9_]+\.html)', html)) - {"index.html", "index2.html"}


def crawl():
    pages = {"Overview": fetch(BASE + "index.html")}
    seen, queue = set(), list(SEED_ASSETS)
    while queue:
        batch = [p for p in dict.fromkeys(queue) if p not in seen]
        queue = []
        seen.update(batch)
        with ThreadPoolExecutor(16) as ex:
            for name, html in zip(batch, ex.map(lambda p: fetch(BASE + "assets/" + p), batch)):
                if html is None:
                    print(f"  404: {name}", file=sys.stderr)
                    continue
                pages[name[:-5]] = html
                queue += [p for p in asset_links(html) if p not in seen]
    return pages


def first_sentence(md_body):
    for para in md_body.split("\n\n"):
        para = para.strip()
        if not para or para.startswith(("#", "-", "|")) or para == "**[PRO ONLY]**":
            continue
        para = re.sub(r"\s+", " ", para.replace("  \n", " "))
        m = re.match(r"(.+?\.)(\s|$)", para)
        return (m.group(1) if m else para)[:220]
    return ""


def build_index(converted):
    funcs = converted.get("Functions", "")
    lines = [
        "# CMO Lua function index",
        "",
        "Auto-generated by `tools/fetch_cmo_docs.py` from https://commandlua.github.io/ "
        f"on {date.today().isoformat()}. One line per function: signature, summary, link to the full page.",
        "",
    ]
    section = None
    for raw in funcs.splitlines():
        s = raw.strip()
        if re.match(r"^\*[^*].*\*$", s):
            section = s.strip("*")
            lines += ["", f"## {section}", "", "| Function | Summary |", "|---|---|"]
            continue
        if s.startswith("### Command: Professional"):
            lines += ["", "## Professional Edition only", "", "| Function | Summary |", "|---|---|"]
            continue
        m = re.match(r"^- \[([^\]]+)\]\(([A-Za-z0-9_]+)\.md", s)
        if not m:
            continue
        page = m.group(2)
        body = converted.get(page)
        if body is None:
            lines.append(f"| `{m.group(1)}` | *(no upstream page)* |")
            continue
        body = re.sub(r'<a name="[^"]*"></a>\s*', "", body)
        head = next((ln for ln in body.splitlines() if ln.startswith("#")), m.group(1))
        sig = re.sub(r"\s+", " ", head.lstrip("# ").replace("\\", "")).strip()
        desc = first_sentence(body.split("\n", 1)[1] if "\n" in body else "").replace("|", "\\|")
        desc = re.sub(r"\]\(([A-Za-z0-9_]+\.md)", r"](reference/\1", desc)
        lines.append(f"| [`{sig}`](reference/{page}.md) | {desc} |")
    return "\n".join(lines) + "\n"


def main():
    print("Crawling", BASE)
    pages = crawl()
    os.makedirs(OUT, exist_ok=True)
    converted = {}
    for name, html in sorted(pages.items()):
        md = html_to_md(html)
        if name == "Overview":
            # Upstream index has a long changelog first; keep it, it is useful.
            pass
        converted[name] = md
        with open(os.path.join(OUT, name + ".md"), "w", encoding="utf-8") as f:
            f.write(md)
    with open(INDEX_OUT, "w", encoding="utf-8") as f:
        f.write(build_index(converted))
    print(f"Wrote {len(converted)} pages to {OUT} and {INDEX_OUT}")


if __name__ == "__main__":
    main()

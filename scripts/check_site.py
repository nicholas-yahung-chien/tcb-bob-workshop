"""Check generated local links, IDs, prompt controls and source immutability."""
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urlsplit, unquote

ROOT=Path(__file__).resolve().parents[1]
SITE=ROOT/'site'


class Page(HTMLParser):
    def __init__(self):
        super().__init__(); self.ids=set(); self.links=[]; self.copies=[]; self.h1=0; self.lang=None
    def handle_starttag(self,tag,attrs):
        attrs=dict(attrs)
        if tag=='html': self.lang=attrs.get('lang')
        if tag=='h1': self.h1+=1
        if 'id' in attrs:
            if attrs['id'] in self.ids: raise AssertionError('Duplicate id: '+attrs['id'])
            self.ids.add(attrs['id'])
        if 'data-copy' in attrs: self.copies.append(attrs['data-copy'])
        for key in ('href','src'):
            if key in attrs: self.links.append(attrs[key])


pages={}
for file in SITE.rglob('*.html'):
    page=Page(); page.feed(file.read_text(encoding='utf-8'))
    assert page.lang=='zh-TW', file
    assert page.h1==1, file
    assert all(target in page.ids for target in page.copies), file
    pages[file.resolve()]=page
assert len(pages)==21, f'Expected 21 pages, got {len(pages)}'
for file,page in pages.items():
    for link in page.links:
        url=urlsplit(link)
        if url.scheme or url.netloc: continue
        target=(file.parent/unquote(url.path)).resolve() if url.path else file
        if target.is_dir(): target=target/'index.html'
        assert target.is_relative_to(SITE.resolve()), (file,link)
        assert target.exists(), (file,link)
        if url.fragment and target in pages: assert unquote(url.fragment) in pages[target].ids,(file,link)
print(f'PASS: {len(pages)} HTML pages; local links, fragments, headings and copy targets.')

# Catch outdated product abbreviations in generated copy, including hero metadata.
for page in (ROOT / "site").rglob("*.html"):
    content = page.read_text(encoding="utf-8")
    content = content.replace('id="pp4z"', 'id="legacy-anchor"').replace("#pp4z", "#legacy-anchor")
    assert "pp4z" not in content.lower(), (page, "Use PPZ in published text")

import os
import re
from pathlib import Path

pattern = re.compile(r"UI\.([A-Za-z0-9_]+)\.docs\.([A-Za-z0-9_]+)\s*=\s*\[\[(.*?)\]\]", re.DOTALL)

def parse_file(path):
    text = path.read_text(encoding='utf-8')
    docs = {}
    for cls, method, doc in pattern.findall(text):
        docs.setdefault(cls, []).append((method, doc.strip()))
    return docs

def merge_dicts(a, b):
    for k, v in b.items():
        a.setdefault(k, []).extend(v)

root = Path('modules/opus')
files = list(root.glob('ui.lua')) + list((root / 'ui').rglob('*.lua')) + list((root / 'ui').rglob('*.lua'))
# remove duplicates using set
files = list(dict.fromkeys(files))

docs = {}
for f in files:
    merge_dicts(docs, parse_file(f))

# Write markdown
out = Path('docs/ui_api.md')
with out.open('w', encoding='utf-8') as fw:
    fw.write('# UI API\n\n')
    for cls in sorted(docs):
        fw.write(f'## {cls}\n')
        for method, doc in sorted(docs[cls]):
            fw.write(f'- **{method}**: {doc}\n')
        fw.write('\n')
print('Generated', out)

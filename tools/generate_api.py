import re
from pathlib import Path

UI_PATTERN = re.compile(r"UI\.([A-Za-z0-9_]+)\.docs\.([A-Za-z0-9_]+)\s*=\s*\[\[(.*?)\]\]", re.DOTALL)
UTIL_PATTERN = re.compile(r"function\s+Util\.([A-Za-z0-9_]+)\s*\(")


def parse_ui_docs():
    root = Path('modules/opus')
    files = {root / 'ui.lua'}
    files.update((root / 'ui').rglob('*.lua'))
    docs = {}
    for path in files:
        text = path.read_text(encoding='utf-8')
        for cls, method, doc in UI_PATTERN.findall(text):
            docs.setdefault('UI.' + cls, []).append((method, doc.strip()))
    return docs


def parse_util_docs():
    util_path = Path('modules/opus/util.lua')
    text = util_path.read_text(encoding='utf-8')
    docs = []
    for name in UTIL_PATTERN.findall(text):
        docs.append((name, ''))
    return {'Util': docs}


def merge_dicts(*dicts):
    result = {}
    for d in dicts:
        for k, v in d.items():
            result.setdefault(k, []).extend(v)
    return result


def generate():
    docs = merge_dicts(parse_ui_docs(), parse_util_docs())
    out = Path('docs/api.md')
    with out.open('w', encoding='utf-8') as fw:
        fw.write('# API Reference\n\n')
        for cls in sorted(docs):
            fw.write(f'## {cls}\n')
            for name, doc in sorted(docs[cls]):
                if doc:
                    fw.write(f'- **{name}**: {doc}\n')
                else:
                    fw.write(f'- **{name}**\n')
            fw.write('\n')
    print('Generated', out)


if __name__ == '__main__':
    generate()

import re
from pathlib import Path

# Matches documentation blocks embedded in the UI modules
UI_PATTERN = re.compile(
    r"UI\.([A-Za-z0-9_]+)\.docs\.([A-Za-z0-9_]+)\s*=\s*\[\[(.*?)\]\]",
    re.DOTALL,
)

# Matches function definitions like `function Module.func(` or `local function name(`
FUNCTION_PATTERN = re.compile(
    r"(?:local\s+)?function\s+([A-Za-z0-9_]+)([:\.])?([A-Za-z0-9_]*)\s*\(",
)


def parse_ui_docs():
    """Extract method documentation embedded in the UI modules."""
    root = Path("modules/opus")
    files = {root / "ui.lua"}
    files.update((root / "ui").rglob("*.lua"))
    docs = {}
    for path in files:
        text = path.read_text(encoding="utf-8")
        for cls, method, doc in UI_PATTERN.findall(text):
            docs.setdefault("UI." + cls, []).append((method, doc.strip()))
    return docs


def _extract_comment(lines, idx):
    """Return comment lines immediately preceding idx (function line)."""
    j = idx - 1
    # skip blank lines
    while j >= 0 and not lines[j].strip():
        j -= 1
    if j < 0:
        return ""
    line = lines[j].lstrip()
    # multi-line comment block
    if line.endswith("]]"):
        block = []
        while j >= 0:
            cur = lines[j].strip()
            block.insert(0, cur)
            if cur.startswith("--[["):
                break
            j -= 1
        cleaned = []
        for l in block:
            l = l.strip()
            l = re.sub(r"^--\[\[", "", l)
            l = re.sub(r"\]\]$", "", l)
            cleaned.append(l)
        return "\n".join(cleaned).strip()
    # single line comments
    if line.startswith("--"):
        block = []
        while j >= 0 and lines[j].lstrip().startswith("--"):
            block.insert(0, lines[j].lstrip()[2:].strip())
            j -= 1
        return " ".join(block).strip()
    return ""


def parse_function_names():
    """Collect function names and comments from all modules."""
    root = Path("modules/opus")
    modules = {}
    for path in root.rglob("*.lua"):
        lines = path.read_text(encoding="utf-8").splitlines()
        mod_name = str(path.relative_to(root)).replace("/", ".").rsplit(".lua", 1)[0]
        for idx, line in enumerate(lines):
            m = FUNCTION_PATTERN.search(line)
            if not m:
                continue
            prefix, sep, name = m.groups()
            if sep:
                module = prefix
                func = name
            else:
                module = mod_name
                func = prefix
            doc = _extract_comment(lines, idx)
            modules.setdefault(module, {})[func] = doc
    return {
        mod: [(name, modules[mod][name]) for name in sorted(modules[mod])]
        for mod in modules
    }


def merge_docs(funcs, ui_docs):
    """Merge simple function lists with UI documentation."""
    result = {}
    for mod, items in funcs.items():
        result.setdefault(mod, {})
        for name, doc in items:
            result[mod][name] = doc
    for mod, items in ui_docs.items():
        result.setdefault(mod, {})
        for name, doc in items:
            result[mod][name] = doc
    # return sorted lists of (name, doc)
    return {
        mod: [(name, result[mod][name]) for name in sorted(result[mod])]
        for mod in result
    }


def generate():
    docs = merge_docs(parse_function_names(), parse_ui_docs())
    out = Path("docs/api.md")
    with out.open("w", encoding="utf-8") as fw:
        fw.write("# API Reference\n\n")
        for cls in sorted(docs):
            fw.write(f"## {cls}\n")
            for name, doc in docs[cls]:
                if doc:
                    fw.write(f"- **{name}**: {doc}\n")
                else:
                    fw.write(f"- **{name}**: No documentation available\n")
            fw.write("\n")
    print("Generated", out)


if __name__ == "__main__":
    generate()

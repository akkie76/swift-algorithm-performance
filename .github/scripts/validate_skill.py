#!/usr/bin/env python3
"""Validate the repository's distributable Swift skill."""

from pathlib import Path
import re
import sys


ROOT = Path(__file__).resolve().parents[2]
SKILL_PATH = ROOT / "skills/swift-algorithm-performance/SKILL.md"
README_PATHS = (ROOT / "README.md", ROOT / "README.ja.md")
MAX_DESCRIPTION_LENGTH = 1024


def fail(message: str) -> None:
    print(f"Validation failed: {message}", file=sys.stderr)
    raise SystemExit(1)


def main() -> None:
    if not SKILL_PATH.is_file():
        fail(f"missing {SKILL_PATH.relative_to(ROOT)}")

    text = SKILL_PATH.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        fail("SKILL.md must start with YAML frontmatter")

    frontmatter, separator, _ = text[4:].partition("\n---\n")
    if not separator:
        fail("SKILL.md frontmatter must end with ---")

    fields = {}
    for line in frontmatter.splitlines():
        match = re.fullmatch(r"([A-Za-z][A-Za-z0-9_-]*):\s*(.+)", line)
        if match:
            key, value = match.groups()
            fields[key] = value.strip().strip("\"'")

    if fields.get("name") != SKILL_PATH.parent.name:
        fail("frontmatter name must match the skill directory name")
    description = fields.get("description", "").strip()
    if not description:
        fail("frontmatter must include a non-empty description")
    if len(description) > MAX_DESCRIPTION_LENGTH:
        fail(f"frontmatter description must be {MAX_DESCRIPTION_LENGTH} characters or fewer")

    heading_levels = []
    for path in README_PATHS:
        if not path.is_file():
            fail(f"missing {path.relative_to(ROOT)}")
        readme = path.read_text(encoding="utf-8")
        heading_levels.append([
            len(match.group(1))
            for line in readme.splitlines()
            if (match := re.match(r"^(#{1,6})\s+\S", line))
        ])
    if heading_levels[0] != heading_levels[1]:
        fail("English and Japanese README heading structures must match")

    for heading in ("Workflow", "Report"):
        if not re.search(rf"^## {re.escape(heading)}\s*$", text, re.MULTILINE):
            fail(f"SKILL.md must include a '## {heading}' section")

    for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)", text):
        target = target.strip().split("#", 1)[0].split("?", 1)[0]
        if not target or target.startswith("/") or re.match(r"^[A-Za-z][A-Za-z0-9+.-]*:", target):
            continue
        if not (SKILL_PATH.parent / target).exists():
            fail(f"broken local link in SKILL.md: {target}")

    print("Skill validation passed.")


if __name__ == "__main__":
    main()

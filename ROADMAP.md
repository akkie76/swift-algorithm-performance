# Roadmap to v1.0.0

[日本語](ROADMAP.ja.md)

This repository will grow in three small milestones. The skill focuses on improving Swift data-processing code through better algorithms and collection choices. It weighs the required output, traversal count, behavior constraints such as ordering and duplicates, time and memory costs, and measurements, while preserving behavior.

## v0.1.0 — First usable skill

- Add one portable `SKILL.md` with standard `name` and `description` metadata, clear triggers, and scope boundaries.
- Add concise English and Japanese READMEs covering the skill's scope, installation, invocation, limitations, and license.
- Guide the agent to identify costly work and choose an algorithm or collection based on the required output, traversal count, behavior constraints, input size, and time and memory costs.
- Require behavior preservation and caution against speculative micro-optimizations.
- Install and explicitly invoke the skill in both Codex and Claude Code with a representative Swift data-processing task.
- Publish `v0.1.0-beta.1` with release notes, then publish `v0.1.0` after checking the release candidate.

**Done when:** the same skill can be installed and explicitly invoked in both Codex and Claude Code for a focused Swift performance task.

## v0.2.0 — Examples and evaluation

- Add a small set of representative Swift examples, such as search, deduplication, aggregation, and sorting.
- Include cases where an optimization is not worthwhile or changes behavior.
- Record correctness checks, benchmark conditions, trade-offs, and results where measurements are available.

**Done when:** the examples show when the skill's recommendations help and when they do not in both Codex and Claude Code.

## v1.0.0 — Stable release

- Review the skill's scope, instructions, and examples for consistency.
- Add detailed installation and contribution guidance.
- Validate the skill package and publish a release with usage and known limitations documented.

**Done when:** a new user can install the skill, understand its scope, and follow its recommendations with appropriate evidence.

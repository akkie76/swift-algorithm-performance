# Roadmap to v1.0.0

[日本語](ROADMAP.ja.md)

This repository has two pre-release milestones before the stable `v1.0.0` release. The skill focuses on improving Swift data-processing code through better algorithms and collection choices. It weighs the required output, traversal count, behavior constraints such as ordering and duplicates, time and memory costs, and measurements, while preserving behavior. No stable `v0.x.0` releases are planned.

## v0.1.0-beta.1 — First usable beta

- [x] Add one portable `SKILL.md` with standard `name` and `description` metadata, clear triggers, and scope boundaries.
- [x] Add concise English and Japanese READMEs covering the skill's scope, installation, invocation, limitations, and license.
- [x] Make the skill useful during implementation, review, and optimization when input size or repeated collection operations may affect performance; guide the agent to choose based on the required output, traversal count, behavior constraints, input size, and time and memory costs.
- [x] Preserve behavior, verify a candidate's correctness and performance before recommending it as an improvement, and include the checked code change when implementation is requested.
- [x] Install and explicitly invoke the skill in both Codex and Claude Code with a representative Swift data-processing task.
- [x] Publish `v0.1.0-beta.1` with release notes.

**Done when:** the same skill can be installed and explicitly invoked in both Codex and Claude Code for a focused Swift performance task.

## v0.2.0-beta.2 — Examples and evaluation

- [x] Add a small set of representative Swift examples, such as search, deduplication, aggregation, and sorting.
- [x] Include cases where an optimization is not worthwhile or changes behavior.
- [x] Record correctness checks, benchmark conditions, trade-offs, and results where measurements are available.
- [x] Validate the skill with representative tasks in Codex and Claude Code.
- [ ] Publish `v0.2.0-beta.2` with release notes.

**Done when:** the examples show when the skill's recommendations help and when they do not in both Codex and Claude Code, and `v0.2.0-beta.2` is published.

## v1.0.0 — Stable release

- Review the skill's scope, instructions, and examples for consistency.
- Add detailed installation and contribution guidance.
- Validate the skill package and publish a release with usage and known limitations documented.

**Done when:** a new user can install the skill, understand its scope, and follow its recommendations with appropriate evidence.

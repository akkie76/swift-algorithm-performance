# Roadmap to v1.0.0

[日本語](ROADMAP.ja.md)

This repository will grow in three small milestones. The skill focuses on improving Swift data-processing code through better algorithms and collection choices, while preserving behavior and checking performance claims with measurements when practical.

## v0.1.0 — First usable skill

- Add `SKILL.md` with clear triggers, scope, and boundaries.
- Guide the agent to identify costly work, consider input size and operation patterns, and choose a suitable algorithm or collection.
- Require behavior preservation and caution against speculative micro-optimizations.

**Done when:** the skill can be installed and used for a focused Swift performance task.

## v0.2.0 — Examples and evaluation

- Add a small set of representative Swift examples, such as search, deduplication, aggregation, and sorting.
- Include cases where an optimization is not worthwhile or changes behavior.
- Record correctness checks, benchmark conditions, trade-offs, and results where measurements are available.

**Done when:** the examples show when the skill's recommendations help and when they do not.

## v1.0.0 — Stable release

- Review the skill's scope, instructions, and examples for consistency.
- Add concise installation and contribution guidance.
- Validate the skill package and publish a release with usage and known limitations documented.

**Done when:** a new user can install the skill, understand its scope, and follow its recommendations with appropriate evidence.

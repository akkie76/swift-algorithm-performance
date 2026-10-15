# Swift Algorithm Performance

[日本語](README.ja.md)

A shared Codex and Claude Code skill for improving performance-sensitive Swift data-processing code.

It helps identify costly work and choose an algorithm or collection based on the required output, traversal count, behavior constraints such as ordering and duplicates, time and memory costs, and measurements.

## Scope

Use it while implementing, reviewing, or improving data-processing work such as searching, filtering, deduplication, grouping, aggregation, and sorting when input size or repeated collection operations may affect performance. It checks candidate changes for correctness and compares performance before presenting them as verified improvements.

It does not cover low-level type representation changes such as converting a `struct` to a `class`, SwiftUI rendering, app launch, or general profiling.

## Install

Clone the release version you want to use:

```sh
git clone --depth 1 --branch v0.1.0-beta.1 https://github.com/akkie76/swift-algorithm-performance.git
```

Install the skill for your agent.

### Codex

```sh
mkdir -p ~/.codex/skills
cp -R swift-algorithm-performance/skills/swift-algorithm-performance ~/.codex/skills/
```

### Claude Code

```sh
mkdir -p ~/.claude/skills
cp -R swift-algorithm-performance/skills/swift-algorithm-performance ~/.claude/skills/
```

Start a new session after installing or updating the skill.

## Use

In Codex, ask directly:

> Use the `swift-algorithm-performance` skill to review this Swift search code. Preserve its behavior and explain the complexity and memory trade-offs.

In Claude Code, invoke `/swift-algorithm-performance` and describe the code to review.

## Limits

Recommendations depend on the code, input sizes, and workload. Complexity analysis alone does not establish a runtime improvement. The skill compares the original and candidate implementations in an optimized build with representative inputs before calling an improvement verified. If it cannot measure the change, it labels the suggestion as an unverified candidate. For code-improvement requests, it provides the minimal relevant code or diff for the checked candidate.

## License

This project is available under the [MIT License](LICENSE).

For details about skill discovery and installation, see the [Codex skills guide](https://developers.openai.com/codex/skills/) and [Claude Code skills documentation](https://code.claude.com/docs/en/skills).

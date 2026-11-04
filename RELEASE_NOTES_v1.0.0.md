# Swift Algorithm Performance v1.0.0

First stable release of the shared Codex and Claude Code skill for performance-sensitive Swift data-processing work.

## What's included

- Guidance for implementing, reviewing, and improving search, filtering, deduplication, grouping, aggregation, and sorting code.
- Recommendations based on required output, traversal count, behavior constraints such as ordering and duplicates, input size, and time and memory costs.
- Correctness checks and optimized-build measurements before a change is presented as a verified performance improvement.
- Swift examples for search, deduplication, aggregation, and selecting a best item without sorting the full collection.
- Installation, update, and uninstall instructions for Codex and Claude Code, plus contribution guidance.

## Validation

- `python3 .github/scripts/validate_skill.py` — passed.
- `swift examples/Examples.swift` — passed; all algorithm examples passed.

## Scope and limitations

The skill focuses on Swift data-processing algorithms and collection operations. Low-level type representation changes, SwiftUI rendering, app launch, and general profiling are out of scope.

Performance depends on the code, input sizes, data distribution, and call pattern. Complexity analysis alone does not establish a runtime improvement. Benchmark representative workloads in an optimized build; if measurement is unavailable, treat the recommendation as an unverified candidate.

<details>
<summary>日本語</summary>

# Swift Algorithm Performance v1.0.0

CodexとClaude Codeで使える、Swiftの性能に関わるデータ処理向け共通Skillの初回安定版です。

## 含まれる内容

- 探索、フィルタリング、重複排除、グループ化、集計、ソートの実装・レビュー・改善を支援します。
- 必要な出力、走査回数、順序や重複などの動作条件、入力規模、時間とメモリのコストを踏まえて改善案を検討します。
- 性能改善として提示する前に、正しさを確認し、最適化ビルドで計測する手順を含みます。
- 探索、重複排除、集計、全件ソートをせずに最適な項目を選ぶSwiftサンプルを収録しています。
- CodexとClaude Codeのインストール・更新・削除方法と、コントリビューション手順を記載しています。

## 検証

- `python3 .github/scripts/validate_skill.py` — 成功。
- `swift examples/Examples.swift` — 成功。すべてのアルゴリズム例が通りました。

## 対象範囲と制約

Swiftのデータ処理アルゴリズムとコレクション操作を対象とします。低レベルな型表現の変更、SwiftUIの描画、アプリ起動、一般的なプロファイリングは対象外です。

性能はコード、入力規模、データ分布、呼び出し方によって変わります。計算量の分析だけでは性能改善を証明できません。最適化ビルドで実際の処理に合った入力を計測し、計測できない場合は未検証の候補として扱います。

</details>

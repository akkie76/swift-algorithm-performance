# Swift Algorithm Performance

[English](README.md)

Swiftのデータ処理コードの性能改善を支援する、CodexとClaude Code共通のSkillです。

必要な出力、走査回数、順序や重複などの動作条件、時間とメモリのコスト、計測結果を踏まえて、処理の重い箇所と改善案を検討します。

## 対象範囲

探索、フィルタリング、重複排除、グループ化、集計、ソートなど、入力規模や繰り返すコレクション操作が性能に関わるデータ処理の実装・レビュー・改善に使います。改善案は動作を確認し、性能を比較したうえで検証済みとして提示します。

`struct` から `class` への変更などの型表現の見直し、SwiftUIの描画、アプリ起動、一般的なプロファイリングは対象外です。

## インストール

利用するリリース版をcloneします。

```sh
git clone --depth 1 --branch v0.1.0-beta.1 https://github.com/akkie76/swift-algorithm-performance.git
```

利用するエージェントの場所へSkillをコピーします。

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

インストールまたは更新後、新しいセッションを開始してください。

## 使い方

対象となるSwiftのデータ処理では、Skillが自動的に選ばれることもあります。確実に使いたい場合は、明示的に呼び出してください。

Codexでは、たとえば次のように依頼します。

> `swift-algorithm-performance` Skillを使って、このSwiftの探索処理を確認してください。動作を保ち、計算量とメモリのトレードオフを説明してください。

Claude Codeでは、`/swift-algorithm-performance` を実行して、確認したいコードを説明します。

## 制約

改善案はコード、入力規模、実際の処理内容に左右されます。計算量の分析だけでは実行時間の改善を証明できません。元の処理と候補を、最適化ビルドで代表的な入力を使って比較します。計測できない場合は未検証の候補として示します。コード改善を求められた場合は、確認した候補の最小限のコード例か差分を提示します。

## ライセンス

このプロジェクトは[MIT License](LICENSE)で公開しています。

Skillの読み込みとインストールの詳細は、[CodexのSkillガイド](https://developers.openai.com/codex/skills/)と[Claude CodeのSkillドキュメント](https://code.claude.com/docs/en/skills)を参照してください。

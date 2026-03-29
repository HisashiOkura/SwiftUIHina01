# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Run

Xcodeを使ってビルド・実行する。CLIからは `xcodebuild` を使用:

```bash
# ビルド
xcodebuild -project hina01.xcodeproj -scheme hina01 -destination 'platform=iOS Simulator,name=iPhone 16' build

# ユニットテスト実行
xcodebuild test -project hina01.xcodeproj -scheme hina01 -destination 'platform=iOS Simulator,name=iPhone 16'

# 特定のテストのみ実行
xcodebuild test -project hina01.xcodeproj -scheme hina01 -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:hina01Tests/hina01Tests/example
```

## Project Info

- **Bundle ID**: `llc.mobilestart.hina01`
- **Deployment Target**: iOS 26.2
- **Swift Version**: 6.0
- **Target Devices**: iPhone & iPad (`TARGETED_DEVICE_FAMILY = "1,2"`)

## Swift Concurrency

- `SWIFT_DEFAULT_ACTOR_ISOLATION = nonisolated` — デフォルトの actor isolation は `nonisolated`。`@MainActor` などは明示的に付与する
- `SWIFT_APPROACHABLE_CONCURRENCY = NO` — Swift 6 の厳格な concurrency チェックを有効にする
- `Infer Isolated Conformances = NO` — プロトコル準拠への isolation の自動推論は無効。isolation は明示的に宣言する
- `nonisolated(nonsending) by Default = OFF` — `nonisolated` な関数の引数・戻り値に `Sendable` 準拠を要求する（厳格モード）

## Architecture

MVVM + クリーンアーキテクチャ。依存の方向: `Presentation → Domain ← Data`

- **Application/** — `@main` エントリポイント・`AppDelegate`
- **Presentation/** — SwiftUI View・`@Observable` ViewModel（`@MainActor`）
- **Domain/** — Entity（`Sendable` struct）・UseCase（`Sendable` struct）・Repository プロトコル
- **Data/** — Repository 実装・DataSource（Remote/Local）
- `hina01Tests/` — Swift Testingフレームワーク (`@Test`, `#expect`) を使用したユニットテスト
- `hina01UITests/` — XCTestベースのUIテスト

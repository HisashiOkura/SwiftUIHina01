# hina01

iOS アプリ

## 要件

- Xcode 26.3+
- iOS 26.0+
- Swift 6.0

## セットアップ

```bash
git clone <repository-url>
open hina01.xcodeproj
```

## ビルド・実行

Xcode からシミュレータまたは実機を選択して実行。

CLI からビルドする場合:

```bash
xcodebuild -project hina01.xcodeproj -scheme hina01 \
  -destination 'platform=iOS Simulator,name=iPhone 16' build
```

## テスト

```bash
# 全テスト実行
xcodebuild test -project hina01.xcodeproj -scheme hina01 \
  -destination 'platform=iOS Simulator,name=iPhone 16'
```

## アーキテクチャ

MVVM + クリーンアーキテクチャを採用。

| レイヤー | 役割 |
|---------|------|
| Presentation | View / ViewModel |
| Domain | Entity・UseCase・Repository プロトコル |
| Data | Repository 実装・DataSource |

依存の方向: `Presentation → Domain ← Data`

## プロジェクト構成

```
hina01/
├── Application/
│   ├── hina01App.swift       # エントリポイント
│   └── AppDelegate.swift     # UIApplicationDelegate
├── Presentation/
│   └── Home/
│       ├── HomeView.swift
│       └── HomeViewModel.swift
├── Domain/
│   ├── Entities/
│   ├── Repositories/         # Repository プロトコル
│   └── UseCases/
├── Data/
│   ├── Repositories/         # Repository 実装
│   └── DataSources/
├── Info.plist
└── Assets.xcassets/
```

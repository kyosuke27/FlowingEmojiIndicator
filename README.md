# FlowingEmojiIndicator

SwiftUI アプリに、絵文字が画面上を左から右へ流れるローディングアニメーションを追加できます。

## Overview

FlowingEmojiIndicator は、絵文字を左から右へ流す SwiftUI 向けの軽量アニメーションライブラリです。

以下のようなアニメーションを利用できます。

- ウェーブを描きながら流れる
- 移動と停止を繰り返しながら流れる

## Features

- シンプルな SwiftUI アニメーション
- 複数のアニメーションタイプから選択可能
- 表示する絵文字をカスタマイズ可能
- 絵文字の大きさをカスタマイズ可能
- Swift Package Manager に対応


## Requirements

## Requirements

- iOS 16.0+
- Swift 6.0+
- Xcode 16.0+

## Installation

### Swift Package Manager

```bash
https://github.com/kyosuke27/FlowingEmojiIndicator
```

## Usage
```swift
import SwiftUI
import FlowingEmojiIndicator

struct ContentView: View {
    var body: some View {
        VStack {
            FlowingEmojiIndicator(emoji: "😊",indicatorType: .sin)
            FlowingEmojiIndicator(emoji: "🚗", indicatorType: .blankAndMove)
        }
        .padding()
    }
}
```

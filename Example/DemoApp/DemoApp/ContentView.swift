//
//  ContentView.swift
//  DemoApp
//
//  Created by kyosuke on 2026/06/10.
//

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

#Preview {
    ContentView()
}

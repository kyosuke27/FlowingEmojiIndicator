import SwiftUI
import FlowingEmojiIndicator

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            FlowingEmojiIndicator(emoji: "😊",indicatorType: .sin)
            FlowingEmojiIndicator(emoji: "🚗", indicatorType: .blankAndMove)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

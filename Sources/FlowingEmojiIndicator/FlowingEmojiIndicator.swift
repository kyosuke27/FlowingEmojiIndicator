import SwiftUI

public struct FlowingEmojiIndicator: View {
    private let horizontalPadding: CGFloat = 20
    private let emojiWidth: CGFloat = 30
    private let amplitude: CGFloat = 12
    private let duration: TimeInterval = 3
    let emoji:String

    public init(emoji: String) {
        self.emoji = emoji
    }
    
    public var body: some View {
        GeometryReader { geometry in
            TimelineView(.animation) { timeline in
                // 時間の変化量
                let time = timeline.date.timeIntervalSinceReferenceDate
                // 秒数の変化量を変化時間で割って、どの程度の進行具合かを割合に変換
                let progress = (time.truncatingRemainder(dividingBy: duration)) / duration
                
                let startX = -emojiWidth - horizontalPadding
                let endX = geometry.size.width + horizontalPadding
                let x = startX + (endX - startX) * progress
                
                // sin波(3つの波を作る)
                let y = sin(progress * 2 * .pi * 2) * amplitude
                
                Text(emoji)
                    .frame(height:geometry.size.height)
                    .offset(x: x, y: y)
            }
        }
        .frame(height: 60)
    }
}

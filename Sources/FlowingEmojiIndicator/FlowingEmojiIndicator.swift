import SwiftUI

public struct FlowingEmojiIndicator: View {
    let indicatorType:IndicatorType
    let emoji:String
    
    public init(emoji: String,indicatorType:IndicatorType = .sin) {
        self.emoji = emoji
        self.indicatorType = indicatorType
    }
    
    public var body: some View {
        GeometryReader { geometry in
            switch self.indicatorType{
                case .sin:
                    SinWaveContent(emoji: self.emoji, geometry: geometry)
                case .blankAndMove:
                    BlankAndMoveIndicator(emoji: self.emoji, geometry: geometry)
            }
        }
    }
}

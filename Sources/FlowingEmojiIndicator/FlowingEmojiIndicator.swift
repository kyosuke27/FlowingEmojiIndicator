import SwiftUI

public struct FlowingEmojiIndicator: View {
    let height:CGFloat
    let indicatorType:IndicatorType
    let emoji:String
    
    public init(emoji: String,indicatorType:IndicatorType = .sin,height:CGFloat = 50) {
        self.emoji = emoji
        self.indicatorType = indicatorType
        self.height = height
    }
    
    public var body: some View {
        GeometryReader { geometry in
            switch self.indicatorType{
            case .sin:
                SinWaveContent(emoji: self.emoji, geometry: geometry)
                    .frame(height: height)
            case .blankAndMove:
                BlankAndMoveIndicator(emoji: self.emoji, geometry: geometry)
                    .frame(height: height)
            }
        }
    }
}

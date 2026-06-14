//
//  File.swift
//  FlowingEmojiIndicator
//
//  Created by kyosuke on 2026/06/12.
//

import SwiftUI

struct SinWaveContent:View{
    private let horizontalPadding: CGFloat = 20
    private let emojiWidth: CGFloat = 30
    private let amplitude: CGFloat = 12
    private let duration: TimeInterval = 3
    private let geometry:GeometryProxy
    private let iconSize:CGFloat
    let emoji:String
    
    init(emoji: String,iconSize:CGFloat = 18,geometry:GeometryProxy) {
        self.emoji = emoji
        self.iconSize = iconSize
        self.geometry = geometry
    }
    
    var body: some View {
        ZStack{
            // 描画レートの度に呼ばれる
            TimelineView(.animation) { timeline in
                // 時間の変化量
                let time = timeline.date.timeIntervalSinceReferenceDate
                // 秒数の変化量を変化時間で割って、どの程度の進行具合かを割合に変換(0〜1の間)
                // truncatingReminderは少数で余りを求めるメソッド
                let progress = (time.truncatingRemainder(dividingBy: duration)) / duration
                
                let startX = -emojiWidth - horizontalPadding
                let endX = geometry.size.width + horizontalPadding
                let x = startX + (endX - startX) * progress
                
                // sin波(2つの波を作る)
                let y = sin(progress * 2 * .pi * 2) * amplitude
                HStack{
                    Text(emoji)
                        .font(.system(size: iconSize))
                        .offset(x: x, y: y)
                }
                
            }
        }
    }
}

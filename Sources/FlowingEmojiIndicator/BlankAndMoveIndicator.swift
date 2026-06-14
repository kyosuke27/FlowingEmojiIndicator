//
//  File.swift
//  FlowingEmojiIndicator
//
//  Created by kyosuke on 2026/06/12.
//

import SwiftUI

struct BlankAndMoveIndicator:View{
    private var startX:CGFloat = 0
    private var diffX:CGFloat = 50
    // アニメーションの時間
    private let duration: TimeInterval = 10
    /* 画面表示開始時間 */
    private let startDate:Date = Date()
    /* 画面幅 */
    private let widthScreen:CGFloat
    /* 表示文字列 */
    let emoji:String
    /* アイコンサイズ */
    let iconSize:CGFloat

    init(emoji: String,iconSize:CGFloat = 18,geometry:GeometryProxy) {
        self.emoji = emoji
        self.widthScreen = geometry.size.width
        self.iconSize = iconSize
    }
    
    var body: some View {
        ZStack{
            // 描画レートの度に呼ばれる
            TimelineView(.periodic(from: Date(), by: 1)) { timeline in
                // 左の画面外
                let startX = -diffX
                // 右の画面外
                let endX = widthScreen + diffX
                // 左外から右外までの総移動距離
                let totalDistance = endX - startX
                
                // startDateと現在の時刻の差分
                let elapsedTime = timeline.date.timeIntervalSince(startDate)
                
                // 10秒の間でどこのタイミングか(10で割ったあまり)
                // 0 ~ 10
                let currentTime = CGFloat(elapsedTime).truncatingRemainder(dividingBy: duration)
                
                // 0~1の間の割合
                let progress = currentTime/duration
                
                // 左右の端の考慮
                // 左端：-20(左側の画面外)
                let x = startX + (progress * totalDistance)

                HStack{
                    Text(emoji)
                        .font(.system(size: iconSize))
                        .offset(x: x)
                }
                
            }
        }
    }
}

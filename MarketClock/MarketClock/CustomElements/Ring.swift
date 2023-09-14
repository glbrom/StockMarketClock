//
//  Ring.swift
//  MarketClock
//
//  Created by Macbook on 24.07.2023.
//

import SwiftUI

struct Ring: View {
    
    let lineWidth: CGFloat
    let background: Color
    let percentage: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RingShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(background)
            }
        }
    }
}

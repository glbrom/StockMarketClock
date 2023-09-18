//
//  PacificSession.swift
//  MarketClock
//
//  Created by Macbook on 23.07.2023.
//

import SwiftUI

struct PacificSession: View {
    private let lineWidth: Double = 6
    var body: some View {
        ZStack {
            // NZX Wellington # 1
            Ring(lineWidth: lineWidth, background: Color("PacificSession"), percentage: 27)
                .frame(width: 220, height: 220)
                .rotationEffect(Angle(degrees: 331))
            CircleText(radius: 160, text: "NZX - WELLINGTON", frameSize: 228)
                .rotationEffect(Angle(degrees: 20))
                .font(.system(size: 7))
            
            // ASX Sydney # 2
            Ring(lineWidth: lineWidth, background: Color("PacificSession"), percentage: 24.5)
                .frame(width: 205, height: 205)
                .rotationEffect(Angle(degrees: 1))
            CircleText(radius: 160, text: "ASX - SYDNEY", frameSize: 213)
                .rotationEffect(Angle(degrees: 45))
                .font(.system(size: 7))
        }
    }
}

struct PacificExchange_Previews: PreviewProvider {
    static var previews: some View {
        PacificSession()
    }
}

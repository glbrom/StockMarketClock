//
//  MiddleSession.swift
//  MarketClock
//
//  Created by Macbook on 27.07.2023.
//

import SwiftUI

struct MiddleSession: View {
    public let lineWidth: Double = 6
    var body: some View {
        ZStack {
            
            // DFM Dubai ADX Abu-Dabi # 1
            Ring(lineWidth: lineWidth, background: Color("MiddleEasternSession"), percentage: 19)
                .frame(width: 220, height: 220)
                .rotationEffect(Angle(degrees: 91))
            CircleText(radius: 140, text: "DFM - DUBAI", frameSize: 228)
                .rotationEffect(Angle(degrees: 125))
                .font(.system(size: 7))
            
            // TADAWUL Riyadh # 2
            Ring(lineWidth: lineWidth, background: Color("MiddleEasternSession"), percentage: 22)
                .frame(width: 205, height: 205)
                .rotationEffect(Angle(degrees: 106))
            CircleText(radius: 160, text: "TADAWUL - RIYADH", frameSize: 214)
                .rotationEffect(Angle(degrees: 144))
                .font(.system(size: 7))
            
            // JSE Johannesburg # 6
            Ring(lineWidth: lineWidth, background: Color("Johannesburg"), percentage: 32)
                .frame(width: 145, height: 145)
                .rotationEffect(Angle(degrees: 108))
            CircleText(radius: 110, text: "JSE - JOHANNESBURG", frameSize: 153)
                .rotationEffect(Angle(degrees: 165))
                .font(.system(size: 7))
        }
    }
}

struct MiddleEastern_Previews: PreviewProvider {
    static var previews: some View {
        MiddleSession()
    }
}

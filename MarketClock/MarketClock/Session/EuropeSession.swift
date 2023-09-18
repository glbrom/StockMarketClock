//
//  EuropeSession.swift
//  MarketClock
//
//  Created by Macbook on 23.07.2023.
//

import SwiftUI

struct EuropeSession: View {
    private let lineWidth: Double = 6
    var body: some View {
        ZStack {
            // MOEX Moscow # 7
            Ring(lineWidth: lineWidth, background: Color("EuropeSession"), percentage: 36)
                .frame(width: 130, height: 130)
                .rotationEffect(Angle(degrees: 104))
            CircleText(radius: 110, text: "MOEX - MOSCOW", frameSize: 138)
                .rotationEffect(Angle(degrees: 170))
                .font(.system(size: 7))
            
            // FWB Frankfurd SIX zuric LSE london # 8
            Ring(lineWidth: lineWidth, background: Color("EuropeSession"), percentage: 34)
                .frame(width: 115, height: 115)
                .rotationEffect(Angle(degrees: 107))
            CircleText(radius: 100, text: "FWB - FRANKFURT", frameSize: 122)
                .rotationEffect(Angle(degrees: 170))
                .font(.system(size: 7))
            
            // SIX Zurich # 9
            Ring(lineWidth: lineWidth, background: Color("EuropeSession"), percentage: 33.7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: 108))
            CircleText(radius: 90, text: "SIX - ZURICH", frameSize: 108)
                .rotationEffect(Angle(degrees: 170))
                .font(.system(size: 7))
            
            // LSE London # 10
            Ring(lineWidth: lineWidth, background: Color("EuropeSession"), percentage: 33)
                .frame(width: 85, height: 85)
                .rotationEffect(Angle(degrees: 109))
            CircleText(radius: 85, text: "LSE - LONDON", frameSize: 93)
                .rotationEffect(Angle(degrees: 170))
                .font(.system(size: 7))
        }
    }
}

struct EuropeExchange_Previews: PreviewProvider {
    static var previews: some View {
        EuropeSession()
    }
}

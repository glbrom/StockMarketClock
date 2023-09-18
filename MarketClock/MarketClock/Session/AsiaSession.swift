//
//  AsiaSession.swift
//  MarketClock
//
//  Created by Macbook on 23.07.2023.
//

import SwiftUI

struct AsiaSession: View {
    private let lineWidth: Double = 6
    var body: some View {
        ZStack {
            // JPX Tokio # 7
            Ring(lineWidth: lineWidth, background: Color("AsiaSession"), percentage: 24)
                .frame(width: 130, height: 130)
                .rotationEffect(Angle(degrees: 1))
            CircleText(radius: 110, text: "JPX - TOKYO", frameSize: 138)
                .rotationEffect(Angle(degrees: 45))
                .font(.system(size: 7))
            
            // SSE Shanhai # 6
            Ring(lineWidth: lineWidth, background: Color("AsiaSession"), percentage: 22)
                .frame(width: 145, height: 145)
                .rotationEffect(Angle(degrees: 25))
            CircleText(radius: 140, text: "SSE - SHANGHAI", frameSize: 153)
                .rotationEffect(Angle(degrees: 65))
                .font(.system(size: 7))
            
            // HKEX Hong Kong # 5
            Ring(lineWidth: lineWidth, background: Color("AsiaSession"), percentage: 26)
                .frame(width: 160, height: 160)
                .rotationEffect(Angle(degrees: 24))
            CircleText(radius: 150, text: "HKEX - HONG KONG", frameSize: 168)
                .rotationEffect(Angle(degrees: 72))
                .font(.system(size: 7))
            
            // SGX Singapure # 4
            Ring(lineWidth: lineWidth, background: Color("AsiaSession"), percentage: 33)
                .frame(width: 175, height: 175)
                .rotationEffect(Angle(degrees: 16))
            CircleText(radius: 160, text: "SGX - SINGAPORE", frameSize: 183)
                .rotationEffect(Angle(degrees: 75))
                .font(.system(size: 7))
            
            // NSE Mumbai # 3
            Ring(lineWidth: lineWidth, background: Color("AsiaSession"), percentage: 25.6)
                .frame(width: 190, height: 190)
                .rotationEffect(Angle(degrees: 56))
            CircleText(radius: 160, text: "NSE - MUMBAI", frameSize: 198)
                .rotationEffect(Angle(degrees: 100))
                .font(.system(size: 7))
        }
    }
}

struct AsiaExchange_Previews: PreviewProvider {
    static var previews: some View {
        AsiaSession()
    }
}

//
//  USASession.swift
//  MarketClock
//
//  Created by Macbook on 23.07.2023.
//

import SwiftUI

struct USASession: View {
    
    private let lineWidth: Double = 6
    
    var body: some View {
        
        ZStack {
            // B3 Bovespa # 1
            Ring(lineWidth: lineWidth, background: Color("USAsesssion"), percentage: 28.5)
                .frame(width: 220, height: 220)
                .rotationEffect(Angle(degrees: 196))
            CircleText(radius: 160, text: "BM&FBOVESPA - SAO PAULO", frameSize: 228)
                .rotationEffect(Angle(degrees: 250))
                .font(.system(size: 7))
            
            // CME Chicago # 2
            Ring(lineWidth: lineWidth, background: Color("USAsesssion"), percentage: 26)
                .frame(width: 205, height: 205)
                .rotationEffect(Angle(degrees: 205))
            CircleText(radius: 160, text: "CME - CHICAGO", frameSize: 213)
                .rotationEffect(Angle(degrees: 250))
                .font(.system(size: 7))
            
            // TSE Toronto # 3
            Ring(lineWidth: lineWidth, background: Color("USAsesssion"), percentage: 26)
                .frame(width: 190, height: 190)
                .rotationEffect(Angle(degrees: 205))
            CircleText(radius: 160, text: "TSE - TORONTO", frameSize: 198)
                .rotationEffect(Angle(degrees: 250))
                .font(.system(size: 7))
            
            // NYSE NASDAQ NY # 4
            Ring(lineWidth: lineWidth, background: Color("USAsesssion"), percentage: 26)
                .frame(width: 175, height: 175)
                .rotationEffect(Angle(degrees: 205))
            CircleText(radius: 160, text: "NYSE NASDAQ - NEW YORK", frameSize: 183)
                .rotationEffect(Angle(degrees: 250))
                .font(.system(size: 7))
        }
    }
}

struct USAexchange_Previews: PreviewProvider {
    static var previews: some View {
        USASession()
    }
}





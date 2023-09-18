//
//  Cyferblat.swift
//  MarketClock
//
//  Created by Macbook on 25.07.2023.
//

import SwiftUI

struct Cyferblat: View {
    
    var body: some View {
        ZStack {
            Ring(lineWidth: 20, background: Color("CircleStroke").opacity(0.7), percentage: 100)
                .frame(width: 328, height: 328)
                .rotationEffect(Angle(degrees: 0))
            
            ForEach(1..<25) { hour in
                CircleText(radius: 250, text: "\(hour)", frameSize: 350)
                    .rotationEffect(.radians((Double.pi*2 / 24 * Double(hour))))
                    .rotationEffect(Angle(degrees: -1))
            }
            ForEach(0 ..< 60, id: \.self) { i in
                // hours dots...
                Rectangle()
                    .fill(Color.primary).opacity(0.1)
                    .frame(width: 1, height: (i % 1) == 0 ? 130 : 5)
                    .offset(y: 55)
                    .rotationEffect(.init(degrees: Double(i) * 15))
            }
        }
    }
}

struct Cyferblat_Previews: PreviewProvider {
    static var previews: some View {
        Cyferblat()
    }
}

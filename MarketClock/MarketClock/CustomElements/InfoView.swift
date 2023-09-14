//
//  InfoView.swift
//  MarketClock
//
//  Created by Macbook on 28.07.2023.
//

import SwiftUI

struct InfoView: View {
    @Binding var showDetail: Bool
    private let githubURL = URL(string: "https://github.com/glbrom")!
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .center, spacing: 12) {
                    Spacer(minLength: 55)
                    Text("Stock session exchange ")
                    //                        .font(.title)
                        .font(.custom("DIN Condensed", size: 30))
                        .foregroundColor(Color("ColorLight"))
                        .fontWeight(.light)
                        .padding(.top, 20)
                    Spacer()
                    Button(action: {
                        self.showDetail.toggle()
                    }) {
                        Image(systemName: "xmark")
                            .frame(width: 1, height: 1)
                            .font(.system(size: 12))
                            .foregroundColor(Color("EuropeSession"))
                            .padding()
                            .background(Color("ColorLight"))
                            .clipShape(Circle())
                            .padding(.trailing, 12)
                    }
                    .padding(.top, 12)
                }
                
                VStack(alignment: .center, spacing: 8) {
                    
                    Text("The Exchange Clock displays five main sessions in the form of five large groups of stock Markets:")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .font(.footnote)
                        .padding(.horizontal, 2)
                        .frame(width: 350, height: 70)
                        .background(Color("ColorLight"))
                        .cornerRadius(10)
                    
                    Text("Pacific Session - New Zealand Stock Exchange NZX, Australia Stock Exchange ASX")
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                        .font(.footnote)
                        .padding(.horizontal)
                        .frame(width: 350, height: 50)
                        .background(Color("PacificSession"))
                        .cornerRadius(10)
                    
                    Text("Asia Session - Tokyo Stock Exchange JPX, Singapore Exchange SGX, Hong Kong Stock Exchange HKEx, Shanghai Stock Exchange SSE, India National Stock Exchange NSE")
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                        .font(.footnote)
                        .padding(.horizontal)
                        .frame(width: 350, height: 80)
                        .background(Color("AsiaSession"))
                        .cornerRadius(10)
                    
                    Text("Middle Eastern Session - Dubai Financial Market DFM, Saudi Stock Exchange TADAWUL")
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                        .font(.footnote)
                        .padding(.horizontal)
                        .frame(width: 350, height: 50)
                        .background(Color("MiddleEasternSession"))
                        .cornerRadius(10)
                    
                    Text("European Session - together with Johannesburg Stock Exchange JSE, Moscow Exchange MOEX, London Stock Exchange LSE, Swiss Stock Exchange SIX, Frankfurt Stock Exchange FWB")
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                        .font(.footnote)
                        .padding(.horizontal)
                        .frame(width: 350, height: 80)
                        .background(Color("EuropeSession"))
                        .cornerRadius(10)
                    
                    Text("American Session - together with B3 Brazilian Stock Exchange BOVESPA, New York Stock Exchange NYSE, NASDAQ Stock Exchange, Toronto Stock Exchange TSX, Chicago Stock Exchange CME")
                        .foregroundColor(.black)
                        .font(.system(size: 13.5))
                        .font(.footnote)
                        .padding(.horizontal, 13)
                        .frame(width: 350, height: 90)
                        .background(Color("USAsesssion"))
                        .cornerRadius(10)
                }
                .padding(.top, 8)
                
                Spacer()
                
                Button(action: {
                    UIApplication.shared.open(githubURL, options: [:], completionHandler: nil)
                }) {
                    Text("GitHub")
                        .foregroundColor(.white)
                        .frame(width: 321, height: 44)
                        .background(Color("ButtonImageColor"))
                        .cornerRadius(20)
                }
                Spacer()
            }
            .frame(width: 370, height: 620)
            .background(Color("CircleStroke"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.5), radius: 20, x: 0, y: 20)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(showDetail: .constant(true))
    }
}

//
//  MarketClockFace.swift
//  MarketClock
//
//  Created by Macbook on 23.07.2023.
//

import SwiftUI

struct MarketClockFace: View {
    
    @State var isDark = false
    
    var body: some View {
        NavigationView {
            Home(isDark: $isDark)
                .navigationBarHidden(true)
                .preferredColorScheme(isDark ? .dark : . light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MarketClockFace()
    }
}

struct Home: View {
    
    @Binding var isDark: Bool
    
    var width = UIScreen.main.bounds.width
    var hoursAngle: Double {
        let localHour = Double(current_Time.hour)
        return localHour * 15 + 12.5 * Double(current_Time.min) / 60
    }
    
    var minutesAngle: Double {
        Double(current_Time.min) * 6.0
    }
    var secondsAngle: Double {
        Double(current_Time.sec) * 6.0
    }
    
    @State var offset3D: CGSize = .zero
    @State var showDetail = false
    @State private var selectedGMT: Int = 0
    @State var current_Time = Time(min: 0, sec: 0, hour: 0)
    @State var receiver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Stock Market Clock")
                    .font(.custom("DIN Condensed", size: 40))
                    .foregroundColor(isDark ? Color("ColorLight") : Color("ColorDark"))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Spacer(minLength: 0)
                
                ZStack {
                    Circle()
                        .fill(isDark ? Color("ColorDark") : Color("ColorLight"))
                        .opacity(0.9)
                        .blur(radius: 10)
                    
                    Cyferblat()
                    
                    ZStack {
                        USASession()
                            .offset(x: offsetToAngle().degrees * 4, y: offsetToAngle(true).degrees * 4)
                        EuropeSession()
                            .offset(x: offsetToAngle().degrees * 10, y: offsetToAngle(true).degrees * 2)
                        MiddleSession()
                            .offset(x: offsetToAngle().degrees * 6, y: offsetToAngle(true).degrees * 8)
                        AsiaSession()
                            .offset(x: offsetToAngle().degrees * 3, y: offsetToAngle(true).degrees * 5)
                        PacificSession()
                            .offset(x: offsetToAngle().degrees * 7, y: offsetToAngle(true).degrees * 12)
                    }
                    .rotationEffect(Angle(degrees: Double(selectedGMT * 15)))
                    // parallax offect
                    // Rollover Line
                    ForEach(0 ..< 1, id: \.self) { i in
                        // hours dots...
                        Rectangle()
                            .fill(Color("EuropeSession")).opacity(0.8)
                            .frame(width: 2, height: (i % 1) == 0 ? 110 : 5)
                            .offset(y: 70)
                            .rotationEffect(.init(degrees: 135))
                        
                    }
                    .rotationEffect(Angle(degrees: Double(selectedGMT * 15)))
                    
                    ForEach(0 ..< 60, id: \.self) { i in
                        // hours dots...
                        Rectangle()
                            .fill(Color.primary)
                            .frame(width: 2, height: (i % 1) == 0 ? 15 : 5)
                            .offset(y: (width - 110) / 2)
                            .rotationEffect(.init(degrees: Double(i) * 15))
                        // seconds dots
                        Rectangle()
                            .fill(Color.primary)
                            .frame(width: 1, height: (i % 5) == 0 ? 5 : 5)
                            .offset(y: (width - 140) / 2)
                            .rotationEffect(.init(degrees: Double(i) * 6))
                    }
                    // min
                    RoundedRectangle(cornerRadius: .infinity)
                        .fill(Color.primary)
                        .frame(width: 4, height: (width - 150) / 2)
                        .offset(y: -(width - 280) / 2)
                        .rotationEffect(Angle(degrees: minutesAngle))
                    
                    // Hour
                    RoundedRectangle(cornerRadius: .infinity)
                        .fill(Color.primary)
                        .frame(width: 5, height: (width - 250) / 2)
                        .offset(y: -(width - 250) / 4)
                        .rotationEffect(Angle(degrees: hoursAngle))
                    Circle()
                        .fill(Color.primary)
                        .frame(width: 10, height: 10)
                    
                    // sec
                    Rectangle()
                        .frame(width: 2, height: (width - 100) / 2)
                        .offset(y: -(width - 300) / 2)
                        .foregroundColor(.red)
                        .rotationEffect(Angle(degrees: secondsAngle))
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.red)
                }
                // view clock
                .frame(width: width - 80, height: width - 80)
                // parallax
                .rotation3DEffect(offsetToAngle(true), axis: (x: -1, y: 0, z: 0))
                .rotation3DEffect(offsetToAngle(), axis: (x: 0, y: 1, z: 0))
                // optional
                .rotation3DEffect(offsetToAngle(true) * 0.1, axis: (x: 0, y: 0, z: 1))
                
                // parallax
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            offset3D = value.translation
                        }).onEnded({ _ in
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.2, blendDuration: 0.2)) {
                                offset3D = .zero
                            }
                        })
                )
                
                Spacer()
                
                Text("Selected GMT time:")
                    .font(.custom("DIN Condensed", size: 26))
                    .foregroundColor(isDark ? Color("ColorLight") : Color("ColorDark"))
                
                Picker("", selection: $selectedGMT) {
                    ForEach(-12..<13, id: \.self) { gmt in
                        Text("GMT \(gmt > 0 ? "+\(gmt)" : "\(gmt)")")
                    }
                    .font(.title3)
                }
                .pickerStyle(.inline)
                .frame(width: 310, height: 80, alignment: .center)
                .clipped()
                .padding(.top, 8)
                .padding(.bottom, 8)
                
                Text(getTime(for: Double(selectedGMT)))
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                
                HStack(alignment: .center, spacing: 250) {
                    
                    Button(action: { isDark.toggle() }) {
                        Image(systemName: isDark ? "sun.min.fill" : "moon.fill")
                            .font(.system(size: 15))
                            .foregroundColor(isDark ? Color("MiddleEasternSession") : .black)
                            .padding()
                            .background(Color("ColorLight"))
                            .clipShape(Circle())
                    }
                    
                    Button(action: {
                        self.showDetail.toggle()
                    }) {
                        Image(systemName: isDark ? "info.circle" : "info.circle.fill")
                            .font(.system(size: 15))
                            .foregroundColor(Color("EuropeSession"))
                            .padding()
                            .background(Color("ColorLight"))
                            .clipShape(Circle())
                    }
                }
            }
            .onAppear(perform: {
                let calendar = Calendar.current
                
                let min = calendar.component(.minute, from: Date())
                let sec = calendar.component(.second, from: Date())
                let hour = calendar.component(.hour, from: Date())
                
                withAnimation(Animation.linear(duration: 0.01)) {
                    self.current_Time = Time(min: min, sec: sec, hour: hour)
                }
            })
            
            .onReceive(receiver) { _ in
                let calendar = Calendar.current
                
                let min = calendar.component(.minute, from: Date())
                let sec = calendar.component(.second, from: Date())
                let hour = calendar.component(.hour, from: Date())
                
                withAnimation(Animation.linear(duration: 0.01)) {
                    self.current_Time = Time(min: min, sec: sec, hour: hour)
                }
            }
            
            InfoView(showDetail: $showDetail)
                .offset(y: showDetail ? 0 : 900)
                .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0))
        }
        .background(isDark ? editImage("6221798", 1400, 1000) : editImage("6547182", 1400, 1000))
    }
    
    private func getTime(for gmtOffset: Double) -> String {
        let format = DateFormatter()
        format.dateFormat = "HH:mm:ss"
        let timeZone = TimeZone(secondsFromGMT: Int(gmtOffset * 3600))
        format.timeZone = timeZone
        
        return format.string(from: Date())
    }
    
    // Converting offset into X Y Angle - paralaxx
    func offsetToAngle(_ isVertical: Bool = false) -> Angle {
        
        let progress = (isVertical ? offset3D.height : offset3D.width) / (isVertical ? screenSize.height : screenSize.width)
        
        return .init(degrees: progress * 10)
    }
    
    // Device screen Size - parallax
    var screenSize: CGSize = {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else {
            return .zero
        }
        return window.screen.bounds.size
    }()
    
    @ViewBuilder
    private func editImage(_ imageName: String, _ width: CGFloat, _ height: CGFloat) -> some View {
        Image("\(imageName)")
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .clipped()
            .blur(radius: 1)
    }
    
}

struct Time {
    var min: Int
    var sec: Int
    var hour: Int
}

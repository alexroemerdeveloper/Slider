//
//  ContentView.swift
//  Slider
//
//  Created by Alexander Römer on 22.09.20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = 0.4
    @State private var phase: CGFloat = 0.0

    @State private var a: Bool = false
    @State private var b: Bool = false
    @State private var c: Bool = false
    @State private var d: Bool = false

    
    var w = CGFloat(150)
    var h = CGFloat(350)

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Capsule()
                .stroke(lineWidth: 10)
                .fill(Color.white)
                .frame(width: w + 10, height: h + 10)
            
            
            WaterWave(progress: self.progress, phase: self.phase)
                .fill(Color.blue)
                .frame(width: w, height: h, alignment: .center)
                .clipShape(Capsule())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            self.progress = 1 - (value.location.y / self.h)
                            if self.progress < 0 {
                                self.progress = 0.1
                            }
                            if self.progress > 1 {
                                self.progress = 1.0
                            }
                        })
                )
                .onAppear() {
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                        self.phase = .pi + 2
                    }
                }
            
            
            Circle()
                .frame(width: a ? 0 : w/11, height: a ? 0 : w/10)
                .offset(x: w/4, y: h/2.8)
                .foregroundColor(.white)
                .animation(Animation.easeInOut(duration: 0.7).delay(1.5).repeatForever(autoreverses: true))
                .onAppear() {
                    a.toggle()
                }
           
            Circle()
                .frame(width: b ? 0 : w/11, height: b ? 0 : w/11)
                .offset(x: -w/4, y: h/4)
                .foregroundColor(.white)
                .animation(Animation.easeInOut(duration: 0.5).delay(1.8).repeatForever(autoreverses: true))
                .onAppear() {
                    b.toggle()
                }
            
            Circle()
                .frame(width: c ? w/10 : 0, height: c ? 0 : w/10)
                .offset(x: -w/5.5, y: c ? -h/5.5 : h/3.5)
                .foregroundColor(.white)
                .animation(Animation.easeInOut(duration: 2.5).delay(1).repeatForever(autoreverses: false))
                .onAppear() {
                    c.toggle()
                }
            
            Circle()
                .frame(width: d ? w/10 : 0, height: d ? 0 : w/10)
                .offset(x: w/5.5, y: d ? -h/5.5 : h/4)
                .foregroundColor(.white)
                .animation(Animation.easeInOut(duration: 2).delay(1).repeatForever(autoreverses: false))
                .onAppear() {
                    d.toggle()
                }
            
            Text("\(Int(progress * 100)) %")
                .foregroundColor(.white)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

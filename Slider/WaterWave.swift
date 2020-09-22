//
//  WaterWave.swift
//  Slider
//
//  Created by Alexander Römer on 22.09.20.
//

import SwiftUI

struct WaterWave: Shape {
    
    let progress: CGFloat
    var amplitude: CGFloat  = 10
    var waveLength: CGFloat = 20
    var phase: CGFloat
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let midWidth = width / 2
        let progressHeight = height * (1 - progress)
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        for x in stride(from: 0, to: width + 15, by: 5) {
            let relativeX = x / waveLength
            let normalizedLength = (x - midWidth) / midWidth
            let y = progressHeight + sin(phase + relativeX) * amplitude + normalizedLength
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        return path
    }
    
}

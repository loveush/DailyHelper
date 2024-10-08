//
//  FirstOnboard.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 27.09.2024.
//

import SwiftUI

struct OnboardBackground: View {
    static let gradientStart = Color("darkpink")
    static let gradientEnd = Color("pink")
    
    var body: some View {
        ZStack {
            Color("pink")
                .ignoresSafeArea()
            Rectangle()
                .fill(LinearGradient(
                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: .init(x: 0.5, y: 0.04),
                    endPoint: .init(x: 0.5, y: 1)
                ))
                .frame(width: UIScreen.main.bounds.width*2,
                       height: 500)
                .rotationEffect(Angle(degrees: -195))
                .offset(y: 220)
            
            Text("DailyHelper")
                .font(.body)
                .foregroundColor(Color("darkpink"))
                .offset(y:-360)
            
        }
    }
}

#Preview {
    OnboardBackground()
}

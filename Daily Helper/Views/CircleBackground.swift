//
//  CircleBackground.swift
//  Daily Helper
//
//  Created by Любовь Ушакова on 22.10.2024.
//

import SwiftUI

struct CircleBackground: View {
    var isToday: Bool
    var isSelected: Bool

    var body: some View {
        Group {
            if isToday {
                Circle()
                    .fill(Color("pink"))
                    .frame(width: 40, height: 40)
                    .opacity(0.6)
                    .shadow(radius: 2, y: 2)
            } else if isSelected {
                Circle()
                    .fill(Color("pink"))
                    .frame(width: 40, height: 40)
                    .opacity(0.4)
            } else {
                Color.clear
            }
        }
    }
}

#Preview {
    CircleBackground(isToday: true, isSelected: false)
}

//
//  PlayerImage.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/5/25.
//

import SwiftUI

struct PlayerImage: View {
    // MARK: take in a image (Data), size (CGFloat), Highlight (Bool), Accent Color -> View
//    let image: Data
    let size: CGFloat
    let accentColor: Color
    let highlight: Bool
    
    init(
        size: CGFloat,
        accentColor: Color = .black,
        highlight: Bool = false
    ) {
        self.size = size
        self.accentColor = accentColor
        self.highlight = highlight
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: (highlight ? 5 : 0))
                .foregroundStyle(accentColor)
                .shadow(color: accentColor, radius: 10)

            Image("Rowan")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    PlayerImage(size: 60, accentColor: .black, highlight: false)
}

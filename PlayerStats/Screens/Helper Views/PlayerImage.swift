//
//  PlayerImage.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/5/25.
//

import SwiftUI

struct PlayerImage: View {
    // MARK: take in a image (Data), size (CGFloat), Highlight (Bool), Accent Color -> View
    let size: CGFloat
    let accentColor: Color
    let highlight: Bool
    let image: Data?
    
    init(
//        image: Data?,
        size: CGFloat,
        accentColor: Color = .black,
        highlight: Bool = false,
        image: Data? = nil
    ) {
//        self.image = image
        self.size = size
        self.accentColor = accentColor
        self.highlight = highlight
        self.image = image
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: (highlight ? 5 : 0))
                .foregroundStyle(accentColor)
                .shadow(color: accentColor, radius: 10)
            if let image,
               let uiImage = UIImage(data: image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            } else {
                Image("Rowan")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            }
            
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    PlayerImage(size: 250, accentColor: .black, highlight: false)
}

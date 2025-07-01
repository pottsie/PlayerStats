//
//  PlayerListItemView.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import SwiftUI

struct PlayerListItemView: View {
    var body: some View {
        HStack(spacing: 10) {
            Image("Rowan")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            VStack(alignment: .leading) {
                Text("Potts, Michael")
                    .font(.title2)
                Text("Striker")
                    .italic()
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(.horizontal, 0)
    }
}

#Preview {
    PlayerListItemView()
}

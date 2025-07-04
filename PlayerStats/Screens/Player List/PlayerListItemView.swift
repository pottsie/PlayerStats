//
//  PlayerListItemView.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import SwiftUI

struct PlayerListItemView: View {
    let player: Player

    var body: some View {
        HStack(spacing: 10) {
            Image("Rowan")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            VStack(alignment: .leading) {
                Text(player.reverseName)
                    .font(.title2)
                Text("#\(player.jerseyNumber)")
                    .italic()
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(.horizontal, 0)
    }
}

#Preview {
    let preview = Preview(Player.self)
    PlayerListItemView(player: Player.samplePlayers[1])
        .modelContainer(preview.container)
}

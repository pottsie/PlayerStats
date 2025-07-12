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
            if let image = player.image,
               let uiImage = UIImage(data: image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            } else {
                Image("Rowan")
//                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            }
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

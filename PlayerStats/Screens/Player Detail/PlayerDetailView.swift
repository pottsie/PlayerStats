//
//  PlayerDetailView.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/2/25.
//

import SwiftUI
import SwiftData

struct PlayerDetailView: View {
    @Environment(\.modelContext) private var context
    let player: Player
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(player.reverseName)
            }
            .navigationTitle(player.fullName)
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    PlayerDetailView(player: Player.samplePlayers[1])
        .modelContainer(preview.container)
}

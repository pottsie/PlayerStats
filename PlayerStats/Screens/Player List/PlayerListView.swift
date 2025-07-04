//
//  PlayerListView.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import SwiftUI
import SwiftData

struct PlayerListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Player.lastName) private var players: [Player]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(players) { player in
                    PlayerListItemView(player: player)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Players(\(players.count))")
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    preview.addExamples(Player.samplePlayers)
    return PlayerListView()
        .modelContainer(preview.container)
}

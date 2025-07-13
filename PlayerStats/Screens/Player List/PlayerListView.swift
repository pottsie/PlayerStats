//
//  PlayerListView.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/6/25.
//

import SwiftUI
import SwiftData

struct PlayerListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Player.lastName) private var players: [Player]

    init(sortOrder: SortOrder) {
        let sortDescriptors: [SortDescriptor<Player>] = switch sortOrder {
        case .last:
            [SortDescriptor(\Player.lastName), SortDescriptor(\Player.firstName)]
        case .first:
            [SortDescriptor(\Player.firstName), SortDescriptor(\Player.lastName)]
        case .number:
            [SortDescriptor(\Player.jerseyNumber)]
        }
        _players = Query(sort: sortDescriptors)
    }
    var body: some View {
        Group {
            if players.isEmpty {
                ContentUnavailableView("Add your first player to get started", systemImage: "person.fill")
                    .foregroundStyle(.blue)
            } else {
                List {
                    ForEach(players) { player in
                        NavigationLink {
                            PlayerDetailScreen(player: player)
                        } label: {
                            PlayerListItemView(player: player)
                        }

                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let player = players[index]
                            context.delete(player)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    preview.addExamples(Player.samplePlayers)
    return PlayerListView(sortOrder: .number)
        .modelContainer(preview.container)
}

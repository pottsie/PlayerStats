//
//  PlayerListScreen.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import SwiftUI
import SwiftData

struct PlayerListScreen: View {
    @Query(sort: \Player.lastName) private var players: [Player]
    @State private var addNewPlayer = false
    @State private var sortOrder = SortOrder.last
    
    var body: some View {
        NavigationStack {
            PlayerListView(sortOrder: sortOrder)
            .navigationTitle(players.isEmpty ? "Players" : "Players(\(players.count))")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Sort", selection: $sortOrder) {
                            ForEach(SortOrder.allCases) { sortOrder in
                                Text(sortOrder.title)
                                    .tag(sortOrder)
                            }
                        }
                    } label: {
                        Text("Sort") // Display the current selection
                            .bold()
                            .font(.title3)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addNewPlayer = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $addNewPlayer) {
                NewPlayerSheet()
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    preview.addExamples(Player.samplePlayers)
    return PlayerListScreen()
        .modelContainer(preview.container)
}

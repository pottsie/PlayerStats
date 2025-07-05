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
    // MARK: add dynamic sorting via last name, first name, number
    @State private var addNewPlayer = false
    
    var body: some View {
        NavigationStack {
            Group {
                if players.isEmpty {
                    ContentUnavailableView("Add your first player to get started", systemImage: "person.fill")
                        .foregroundStyle(.blue)
                } else {
                    List {
                        ForEach(players) { player in
                            PlayerListItemView(player: player)
                        }
                        // MARK: add onDelete function
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(players.isEmpty ? "Players" : "Players(\(players.count))")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Sort")
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
            // MARK: Add code for displaying the add player sheet
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
    return PlayerListView()
        .modelContainer(preview.container)
}

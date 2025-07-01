//
//  PlayerListView.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import SwiftUI
import SwiftData

struct PlayerListView: View {
    
    var body: some View {
        NavigationStack {
            List {
                PlayerListItemView()
                PlayerListItemView()
            }
            .listStyle(.plain)
            .navigationTitle("Roster")
        }
    }
}

#Preview {
    PlayerListView()
}

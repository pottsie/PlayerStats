//
//  PlayerStatsApp.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import SwiftUI

@main
struct PlayerStatsApp: App {
    var body: some Scene {
        WindowGroup {
            PlayerListView()
        }
        .modelContainer(for: Player.self)
    }
}

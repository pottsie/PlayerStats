//
//  PlayerStatsApp.swift
//  PlayerStats
//
//  Created by Michael Potts on 6/30/25.
//

import SwiftUI
import SwiftData

@main
struct PlayerStatsApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            PlayerListScreen()
        }
        .modelContainer(for: Player.self)
    }
    
    init() {
        let schema = Schema([Player.self])
        let config = ModelConfiguration("MyPlayers", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Failed to create the container")
        }
        
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}

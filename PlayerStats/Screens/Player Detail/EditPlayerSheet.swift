//
//  EditPlayerSheet.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/13/25.
//

import SwiftUI

struct EditPlayerSheet: View {
    let player: Player
    @Environment(\.dismiss) private var dismiss
    @State private var firstName: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Information") {
                    TextField("", text: $firstName)
                }
                
                Section("Contact Information") {
                    
                }
            }
            .navigationTitle(player.fullName)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            firstName = player.firstName
        }
        .toolbar {
            
        }
    }
}


#Preview {
    let preview = Preview(Player.self)
    EditPlayerSheet(player: Player.samplePlayers[0])
        .modelContainer(preview.container)
}

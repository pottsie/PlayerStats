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
    @State private var lastName: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                CustomTextField(input: $firstName, textFieldLabel: "First")
                
                CustomTextField(input: $lastName, textFieldLabel: "Last")
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle(player.fullName)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            firstName = player.firstName
            lastName = player.lastName
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

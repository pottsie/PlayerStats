//
//  PlayerDetailScreen.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/2/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct PlayerDetailScreen: View {
    @Environment(\.modelContext) private var context
    let player: Player
    @State private var selectedImage: PhotosPickerItem?
    @State private var selectedImageData: Data?
    @State private var editPlayer = false
    
    var body: some View {
        NavigationStack {
            Group {
                PlayerImage(size: 250, image: player.image)
                    .overlay(alignment: .bottomTrailing) {
                        PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                            ImagePickerIconView()
                        }
                    }
            }
            .padding(.vertical, 5)
            
            VStack(spacing: 10) { // Maybe a form will allow me to break this into seciotns with headers
                
                VStack(spacing: 2) {
                    Text("#\(player.jerseyNumber) - \(player.position)")
                        .font(.title2)
                        .italic()
                        .bold()
                    Text("Captain")
                        .font(.headline)
                        .opacity(player.isCaptain ? 100 : 0)
                        .padding(.vertical, 0)
                }
                
                LabeledContent("Birthday", value: player.displayDOB)
                
                LabeledContent("Gender", value: player.gender.dscr)
                
                LabeledContent("Height (cm)", value: "\(player.height)")
                
                // MARK: the games will be a link to the list of games
                LabeledContent("Games Played") {
                    Text("9 games")
                }
                
                // MARK: the system image icon will take you to the player stats page
                LabeledContent("Stats") {
                    Image(systemName: "chart.bar.fill")
                }
                
                LabeledContent("Club", value: player.club)
            }
//            .font(.title3)
            .padding(.horizontal)
//            Section {
//                Rectangle()
//                    .foregroundStyle(Color("BlueGreen"))
//                    .frame(width: .infinity, height: 40)
//                    .overlay {
//                        Text("Contact Information")
//                            .textCase(.uppercase)
//                            .font(.caption)
            //                            .foregroundStyle(.white)
            //                            .bold()
            //                    }
            //            }
            ZStack {
                Rectangle()
                    .fill()
                    .foregroundStyle(Color("BlueGreen"))
                Text("Contact Information")
                    .textCase(.uppercase)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .bold()
                    .backgroundStyle(Color("BlueGreen"))
            }
            .frame(width: .infinity, height: 40)
            
            Spacer()
                .navigationTitle(player.fullName)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            // MARK: switch to editing the player information
                            editPlayer = true
                        } label: {
                            Text("Edit")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("BlueGreen"))
                    }
                }
                .sheet(isPresented: $editPlayer, content: {
                    EditPlayerSheet(player: player)
                        .presentationDetents([.large])
                })
                .task(id: selectedImage) {
                    if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                        player.image = data
                    }
                }
        }
    }
}
//}

#Preview {
    let preview = Preview(Player.self)
    NavigationStack {
        PlayerDetailScreen(player: Player.samplePlayers[1])
            .modelContainer(preview.container)
    }
}

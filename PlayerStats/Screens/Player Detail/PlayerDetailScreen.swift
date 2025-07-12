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
    
    var body: some View {
        NavigationStack {
            Group {
                PlayerImage(size: 250, image: player.image)
                    .overlay(alignment: .bottomTrailing) {
                        PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                            ImagePickerIconView()
                            //                            .offset(x: 115, y: 90)
                        }
                    }
            }
            .padding(.vertical, 5)
            
            //            ScrollView {
            VStack(spacing: 10) { // Maybe a form will allow me to break this into seciotns with headers
                Text("#10 - Central Midfield")
                    .font(.title2)
                    .italic()
                    .bold()
                Text("Captain")
                    .font(.headline)
                    .padding(.vertical, 0)
                LabeledContent("Birthday", value: "Sep 20, 1966")
                
                LabeledContent("Gender", value: "Male")
                LabeledContent("Height (cm)", value: "165")
                // MARK: the games will be a link to the list of games
                LabeledContent("Games") {
                    Text("9 games")
                    }
                    // MARK: the system image icon will take you to the player stats page
                    LabeledContent("Stats") {
                        Image(systemName: "chart.bar.fill")
                    }
                    LabeledContent("Club", value: player.club)
                }
                .font(.title3)
                .padding(.horizontal)
                ZStack {
                    Rectangle()
                        .fill()
                            .foregroundStyle(Color("BlueGreen"))
                        Text("Contact Information")
                            .textCase(.uppercase)
                            .font(.caption)
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(width: .infinity, height: 40)
                    
                    Spacer()
//                }
//                .navigationTitle(player.fullName)
//                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            // MARK: switch to editing the player information
                        } label: {
                            Text("Edit")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
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

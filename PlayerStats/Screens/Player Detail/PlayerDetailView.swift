//
//  PlayerDetailView.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/2/25.
//

import SwiftUI
import SwiftData

struct PlayerDetailView: View {
    @Environment(\.modelContext) private var context
    let player: Player
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    PlayerImage(size: 280)
                        .padding(.vertical)
                        .overlay(alignment: .center) {
                            Button {
                                // MARK: photo picker for choosing a new image
                            } label: {
                                //                            Image(systemName: "photo")
                                ImagePickerIconView()
                            }
                            //                        .foregroundStyle(.green)
                            //                        .font(.title)
                            .offset(x: 115, y: 90)
                        }
                    
                    VStack(spacing: 15) { // Maybe a form will allow me to break this into seciotns with headers
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
                }
                .navigationTitle(player.fullName)
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
            }
        }
    }
}

#Preview {
    let preview = Preview(Player.self)
    NavigationStack {
        PlayerDetailView(player: Player.samplePlayers[1])
            .modelContainer(preview.container)
    }
}

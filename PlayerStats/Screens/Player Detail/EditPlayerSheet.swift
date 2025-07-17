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
    @State private var position: String = ""
    @State private var jerseyNumber: String = ""
    @State private var dateOfBirth: Date = Date()
    @State private var height: String = ""
    @State private var club: String = ""
    @State private var captain: Bool = false
    @State private var gender: Gender = .female

    var body: some View {
        NavigationStack {
            ZStack {
                Color("BlueGreen").opacity(0.15)
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    CustomTextField(input: $firstName, textFieldLabel: "First", validationFunction: nil)
                    
                    CustomTextField(input: $lastName, textFieldLabel: "Last", validationFunction: nil)
                    
                    HStack {
                        Text("Date of Birth")
                        Spacer()
                        DatePicker("", selection: $dateOfBirth, in: ...Date(), displayedComponents: .date)
                    }
                    
                    HStack {
                        Text("Gender")
                        Spacer()
                        Picker("Gender", selection: $gender) {
                            ForEach(Gender.allCases) { gender in
                                Text(gender.dscr).tag(gender)
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 125)
                    }
                    
                    CustomTextField(input: $position, textFieldLabel: "Position", validationFunction: nil)
                    
                    CustomTextField(input: $jerseyNumber, textFieldLabel: "Jersey Number", validationFunction: validateJerseyNumber)
                        .keyboardType(.numberPad)
                                        
                    
                    Spacer()
                }
                .padding(.vertical, 25)
                .padding(.horizontal)
                //            .navigationTitle(player.fullName)
                //            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(role: .cancel) {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        //                    .buttonStyle(.borderedProminent)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            player.firstName = firstName
                            player.lastName = lastName
                            player.dateOfBirth = dateOfBirth
                            player.gender = gender
                            player.position = position
                            player.jerseyNumber = jerseyNumber
                            
                            dismiss()
                        } label: {
                            Text("Update")
                        }
                        //                    .buttonStyle(.borderedProminent)
                    }
                }
            }
        }
        .onAppear {
            firstName = player.firstName
            lastName = player.lastName
            dateOfBirth = player.dateOfBirth
            gender = player.gender
            position = player.position
            jerseyNumber = player.jerseyNumber
        }

    }
    
    func validateJerseyNumber() -> ValidationResult {
        let numberPattern = #"^\d{1,2}$"#
        if jerseyNumber.range(of: numberPattern, options: .regularExpression) == nil {
            return .failed("Number must be a 1 or 2 digit number")
        } else {
            return .success
        }
    }
}


#Preview {
    let preview = Preview(Player.self)
    NavigationStack {
        EditPlayerSheet(player: Player.samplePlayers[1])
            .modelContainer(preview.container)
    }
}

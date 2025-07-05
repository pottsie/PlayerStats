//
//  NewPlayerSheet.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/4/25.
//

import SwiftUI
import SwiftData

struct NewPlayerSheet: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("First name", text: $firstName)
                TextField("Last name", text: $lastName)
                Button("Add") {
                    let newPlayer = Player(firstName: firstName, lastName: lastName)
                    context.insert(newPlayer)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(firstName.isEmpty || lastName.isEmpty)
                .navigationTitle("New Player")
                .navigationBarTitleDisplayMode(.inline)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }

                }
            }
        }
    }
}

#Preview {
    NewPlayerSheet()
}

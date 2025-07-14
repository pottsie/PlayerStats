//
//  CustomTextField.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/14/25.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var input: String
    let textFieldLabel: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(textFieldLabel)
                .font(.caption)
                .textCase(.uppercase)
                .foregroundStyle(.secondary)
            TextField(textFieldLabel, text: $input)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    @Previewable @State var sample = ""
    let label = "First name"
    CustomTextField(input: $sample, textFieldLabel: label)
}

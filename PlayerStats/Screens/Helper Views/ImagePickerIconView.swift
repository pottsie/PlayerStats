//
//  ImagePickerIconView.swift
//  PlayerStats
//
//  Created by Michael Potts on 7/8/25.
//

import SwiftUI

struct ImagePickerIconView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color("BlueGreen"))
            Circle()
                .stroke(lineWidth: 2)
                .foregroundStyle(.white)
//            Circle()
//                .fill()
//                .stroke(<#_#>, style: StrokeStyle(lineWidth: 2))
//                .foregroundStyle(.gray)
            Image(systemName: "photo.fill")
                .font(.title3)
                .foregroundStyle(.white)
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    ImagePickerIconView()
}

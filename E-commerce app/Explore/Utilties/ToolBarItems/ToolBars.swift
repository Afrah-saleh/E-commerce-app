//
//  TiilBard.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI

struct ToolBars: View {
    // Customizable properties
    var imageName: String
    var backgroundColor: Color = Color(.systemGray6) // Optional default background color
    var foregroundColor: Color = .black // Optional default foreground color

    var body: some View {
        Button(action: {
            print("Pressed") // Executes the passed action
        }) {
            Image(systemName: imageName) // Use the dynamic image name
                .foregroundColor(foregroundColor) // Customizable foreground color
                .padding()
                .background(backgroundColor) // Customizable background color
                .cornerRadius(30)
        }
    }
}

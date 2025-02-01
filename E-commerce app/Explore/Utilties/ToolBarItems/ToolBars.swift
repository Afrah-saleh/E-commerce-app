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
    var action: () -> Void // ✅ Action closure
    
    var body: some View {
        Button(action: action) { // ✅ Use the action closure
              Image(systemName: imageName)
                  .foregroundColor(foregroundColor)
                  .padding()
                  .background(backgroundColor)
                  .cornerRadius(30)
          }
    }
}

//
//  Serachbars.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI

struct Serachbars: View {
    @State private var searchText = ""
    var body: some View {
        HStack {
            TextField("Serach...", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                print("Voice serach tapped")
            }) {
                Image(systemName: "mic.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.trailing)
        }
    }
}

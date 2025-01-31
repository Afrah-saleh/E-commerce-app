//
//  BrandScrollView.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI

struct BrandScrollView: View {
    var brands: [String] // List of brands
   // var onBrandSelected: ((String) -> Void)? // Action when a brand is selected (optional)

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(brands, id: \.self) { brand in
                    Button(action: {
                       // onBrandSelected?(brand) // Trigger the action when a brand is tapped
                    }) {
                        Text(brand)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

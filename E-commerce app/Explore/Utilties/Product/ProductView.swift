//
//  product.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI

// Reusable ProductScrollView component
struct ProductView: View {
    var products: [Product] // List of products
    // Grid columns definition: Two items per row
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView { // Make it scrollable vertically
            LazyVGrid(columns: columns, spacing: 15) { // Use a grid layout
                ForEach(products) { product in
                    VStack(alignment: .leading) {
                        Image(systemName: product.imageName)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)

                        Text(product.name)
                            .font(.subheadline)

                        Text(product.price)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .frame(width: 120)
                }
            }
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    ProductScrollView(products: <#[Product]#>)
//}

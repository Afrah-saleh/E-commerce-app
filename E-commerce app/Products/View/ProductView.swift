//
//  product.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI

// Reusable ProductScrollView component
struct ProductView: View {
    var products: [Product]
    @ObservedObject var cartViewModel: CartViewModel
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(products) { product in
                    NavigationLink(destination: ProductDetails(product: product, cartViewModel: cartViewModel)) { // ✅ Pass cartViewModel

                        VStack(alignment: .leading) {
                            Image(product.imageName)
                                .resizable()
                                .frame(width: 150, height: 200)
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
            }
            .padding(.horizontal)
        }
        .onAppear {
            print("🟢 Products received in ProductView: \(products)")
        }
    }
}


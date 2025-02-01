//
//  Product_Details.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI

struct ProductDetails: View {
    let product: Product
    @State private var selectedSize: String?
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(product.imageName)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 500)

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Brand: \(product.brand)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Price")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)

                    HStack {
                        Text(product.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Text(product.price)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)

                    Divider()

                    HStack {
                        Spacer()
                        Text("Size Guide")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)

                    // ✅ Selectable Sizes
                    HStack {
                        Text("Sizes:")
                            .font(.headline)

                        ForEach(product.size, id: \.self) { size in
                            Text(size)
                                .frame(width: 40, height: 40)
                                .background(selectedSize == size ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(selectedSize == size ? .white : .black)
                                .cornerRadius(5)
                                .onTapGesture {
                                    selectedSize = size
                                }
                        }
                    }
                    .padding(.horizontal)

                    Divider()

                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.horizontal)

                    Text(product.description ?? "No description available")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }

                // ✅ Add to Cart Button
                Button(action: {
                    guard selectedSize != nil else {
                        print("❌ No size selected")
                        return
                    }
                    cartViewModel.addToCart(product) // ✅ Save to UserDefaults

                }) {
                    Text("Add to cart")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding()

                Spacer()
            }
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: CartView(cartViewModel: cartViewModel)) {
                    HStack {
                        Image(systemName: "cart")
                        Text("\(cartViewModel.cartItems.count)") // ✅ Convert Int to String

                    }
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ProductDetails(product: Product.sample, cartViewModel: CartViewModel())
}

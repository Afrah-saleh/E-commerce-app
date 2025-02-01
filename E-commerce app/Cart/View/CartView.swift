//
//  CartView.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel // ✅ Use CartViewModel
    @State private var isSelecting = false // ✅ Toggle selection mode
    @State private var selectedItems = Set<UUID>() // ✅ Track selected products

    var body: some View {
        NavigationView {
            VStack {
                if cartViewModel.cartItems.isEmpty {
                    Text("🛒 Your cart is empty")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(cartViewModel.cartItems) { product in
                            HStack {
                                if cartViewModel.isSelecting {
                                  Image(systemName: cartViewModel.selectedItems.contains(product.id) ? "checkmark.circle.fill" : "circle")
                                      .foregroundColor(cartViewModel.selectedItems.contains(product.id) ? .blue : .gray)
                                      .onTapGesture {
                                          cartViewModel.toggleSelection(product)
                                      }
                              }
                                Image(product.imageName)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(product.name)
                                        .font(.headline)
                                    Text(product.price)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .swipeActions {
                               Button(role: .destructive) {
                                   cartViewModel.removeFromCart(product)
                               } label: {
                                   Label("Delete", systemImage: "trash")
                               }
                           }
                        }
                    }
                }
            }
            .navigationTitle("🛍️ Cart")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(cartViewModel.isSelecting ? "Cancel" : "Select") {
                        cartViewModel.toggleSelectionMode()
                    }
                }
                if cartViewModel.isSelecting {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Delete") {
                            cartViewModel.deleteSelectedItems()
                        }
                        .foregroundColor(cartViewModel.selectedItems.isEmpty ? .gray : .red)
                        .disabled(cartViewModel.selectedItems.isEmpty)
                    }
                }
            }
        }
    }
}

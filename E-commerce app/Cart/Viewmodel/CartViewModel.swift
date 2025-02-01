//
//  CartViewModel.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI

class CartViewModel: ObservableObject {
    @Published var selectedItems = Set<UUID>() // ✅ Track selected products
     @Published var isSelecting = false // ✅ Toggle selection mode

    @Published var cartItems: [Product] = [] {
        didSet {
            saveCart() // ✅ Save whenever cart updates
        }
    }
    private let cartKey = "savedCart" // ✅ UserDefaults key

        init() {
            loadCart() // ✅ Load saved cart when app starts
        }

    // ✅ Add product to cart
    func addToCart(_ product: Product) {
        cartItems.append(product)
        saveCart()
        print("🛒 Added to cart: \(product.name)")
    }

    // ✅ Remove product from cart
    func removeFromCart(_ product: Product) {
        cartItems.removeAll { $0.id == product.id }
        saveCart()
    }

    // ✅ Save cart to UserDefaults
    private func saveCart() {
        if let encodedData = try? JSONEncoder().encode(cartItems) {
            UserDefaults.standard.set(encodedData, forKey: cartKey)
        }
    }

    // ✅ Load cart from UserDefaults
    private func loadCart() {
        if let savedData = UserDefaults.standard.data(forKey: cartKey),
           let decodedProducts = try? JSONDecoder().decode([Product].self, from: savedData) {
            cartItems = decodedProducts
        }
    }
    
    // ✅ Toggle selection mode
    func toggleSelectionMode() {
        isSelecting.toggle()
        selectedItems.removeAll() // ✅ Reset selections
    }

    // ✅ Toggle an item's selection
    func toggleSelection(_ product: Product) {
        if selectedItems.contains(product.id) {
            selectedItems.remove(product.id)
        } else {
            selectedItems.insert(product.id)
        }
    }

    // ✅ Delete selected items
    func deleteSelectedItems() {
        cartItems.removeAll { selectedItems.contains($0.id) }
        selectedItems.removeAll() // ✅ Clear selection
        isSelecting = false // ✅ Exit selection mode
        saveCart()
    }
}

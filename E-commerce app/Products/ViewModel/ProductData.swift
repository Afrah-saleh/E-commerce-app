//
//  ProductData.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import Foundation

class ProductData: ObservableObject {
    @Published var products: [Product] = []

    init() {
        loadProducts()
    }

    func loadProducts() {
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedProducts = try JSONDecoder().decode([Product].self, from: data)
                self.products = decodedProducts
                print("✅ Successfully loaded products: \(decodedProducts)")
            } catch {
                print("❌ Failed to decode JSON: \(error)")
            }
        } else {
            print("❌ JSON file not found.")
        }
    }
}

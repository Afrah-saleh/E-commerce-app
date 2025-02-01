//
//  Product.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI
import Foundation

// ✅ Product model for dynamic content
struct Product: Identifiable, Codable { // ✅ Conforms to Codable (Encodable + Decodable)
    let id: UUID
    let name: String
    let price: String
    let imageName: String
    let description: String?
    let rating: Double
    let isFavorite: Bool
    let countInStock: Int
    let brand: String
    let size: [String]

    // ✅ Add a Manual Initializer to Allow Object Creation
    init(
        id: UUID = UUID(),
        name: String,
        price: String,
        imageName: String,
        description: String? = "No description available.",
        rating: Double,
        isFavorite: Bool,
        countInStock: Int,
        brand: String,
        size: [String]
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.imageName = imageName
        self.description = description
        self.rating = rating
        self.isFavorite = isFavorite
        self.countInStock = countInStock
        self.brand = brand
        self.size = size
    }


    // ✅ Custom Decoder to Handle Missing ID in JSON
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decode(String.self, forKey: .price)
        self.imageName = try container.decode(String.self, forKey: .imageName)
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? "No description available."
        self.rating = try container.decode(Double.self, forKey: .rating)
        self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        self.countInStock = try container.decode(Int.self, forKey: .countInStock)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.size = try container.decode([String].self, forKey: .size)
    }
}



extension Product {
    static let sample = Product(
        name: "Nike Shoes",
        price: "$99",
        imageName: "photo1",
        description: "High-quality running shoes from Nike.",
        rating: 4.8,
        isFavorite: true,
        countInStock: 20,
        brand: "Nike",
        size: ["S", "M", "L"]
    )
}

// ✅ Custom CodingKeys for JSON Decoding/Encoding
enum CodingKeys: String, CodingKey {
    case id, name, price, imageName, description, rating, isFavorite, countInStock, brand, size
}

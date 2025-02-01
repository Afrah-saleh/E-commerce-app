//
//  Product.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI
import Foundation
// Product model for dynamic content


struct Product: Identifiable, Decodable {
    let id: UUID
    let name: String
    let price: String
    let imageName: String
    let description: String?
    let rating: Double?
    let isFavorite: Bool?
    let countInStock: Int?
    let brand: String?
    let size: [String]?

    // Custom CodingKeys to match JSON property names
    enum CodingKeys: String, CodingKey {
        case id, name, price, imageName, description, rating, isFavorite, countInStock, brand, size
    }

    // Custom decoder to generate a UUID if not provided in JSON
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

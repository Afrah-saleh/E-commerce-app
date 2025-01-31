//
//  Product.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 02/08/1446 AH.
//

import SwiftUI

// Product model for dynamic content
struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let imageName: String
}

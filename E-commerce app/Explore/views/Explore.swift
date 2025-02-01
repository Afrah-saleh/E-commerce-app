//
//  Explore.swift
//  E-commerce app
//
//  Created by Afrah Saleh on 01/08/1446 AH.
//

import SwiftUI

struct Explore: View {
    @State private var searchText = ""
    @State private var brands = ["Adidas","Nike","Fila","Puma"]
    @ObservedObject var productData = ProductData() // Use ObservableObject

    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 20) {
                // Title and Subtitle
                VStack(alignment: .leading, spacing: 5) {
                    Text("Hemendra")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Welcome to Laza.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                // Search Bar
                Serachbars()

                // Choose Brand Section
                VStack(alignment: .leading){
                    HStack {
                        Text("Choose Brand")
                            .font(.headline)
                        Spacer()
                        Button("View All") {
                            print("View all brands tapped")
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    BrandScrollView(brands: brands)
                        .padding(.bottom)
                    HStack {
                        Text("New Arrivals")
                            .font(.headline)
                        Spacer()
                        Button("View All") {
                            print("View all New Arrivals tapped")
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    } .padding(.horizontal)
                    
                    ProductView(products: productData.products)

                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    ToolBars(imageName: "list.bullet.indent")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    ToolBars(imageName: "bag")

                }
            }
            
        }

    }
}

#Preview {
    Explore()
}

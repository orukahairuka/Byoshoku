//
//  ProductCellView.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/13.
//

import SwiftUI
import FirebaseFirestore

struct ProductCellView: View {
    @StateObject private var productcontroll = ProductControll()
    var body: some View {
        VStack {
            ForEach(productcontroll.products) { product in
                VStack(alignment: .leading) {
                    Text("id: \(product.documentId)")
                    Text("カロリー: \(product.calorie)")
                    Text("コレステロール: \(product.cholesterol)")
                    Text("lipid: \(product.lipid)")
                    Text("natrium: \(product.natrium)")
                    Text("potassium: \(product.potassium)")
                    Text("protein: \(product.protein)")
                    Text("Created At: \(formatDate(product.createAt))")
                }
            }
        }
        .onAppear {
            productcontroll.ProductLister()
        }

    }
    private func formatDate(_ timestamp: Timestamp) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: timestamp.dateValue())
    }
}

#Preview {
    ProductCellView()
}

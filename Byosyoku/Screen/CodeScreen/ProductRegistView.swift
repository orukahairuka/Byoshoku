//
//  ProductRegistView.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/13.
//

import SwiftUI

struct ProductRegistView: View {
    @State private var inputText = "入力する"
    @StateObject private var productControll = ProductControll()
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TextEditor(text: $inputText)
                        .frame(width: 300, height: 300)
                        .cornerRadius(10)
                        .border(.gray)
                    Button {
                        //非同期で呼び出す
                        Task {
                            do {
                                try await productControll.saveProduct(productName: "12", calorie: "34", cholesterol: "56", lipid: "78", natrium: "9", potassium: "10", protein: "11")
                            } catch {
                                print("保存できませんでした")
                            }
                        }
                        print("データ追加した")
                    } label: {
                        Text("保存")
                            .foregroundColor(.white)
                    }
                    .frame(width: 160,height: 90)
                    .background(.blue)
                    .cornerRadius(5)
                    NavigationLink(destination: ProductCellView()) {
                        Text("移動")
                    }
                }
            }
        }
    }
}

#Preview {
    ProductRegistView()
}

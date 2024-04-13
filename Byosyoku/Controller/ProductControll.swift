//
//  ProductControll.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/13.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

let db = Firestore.firestore()

public struct Product: Codable, Identifiable {
    public var id: String { documentId }
    let documentId: String
    let productName: String
    let calorie: String
    let cholesterol: String
    let lipid: String
    let natrium: String
    let potassium: String
    let protein: String
    let createAt: Timestamp

    enum CodingKeys: String, CodingKey {
        case documentId
        case productName
        case calorie
        case cholesterol
        case lipid
        case natrium
        case potassium
        case protein
        case createAt
    }
}

class ProductControll: ObservableObject {
    @Published var products: [Product] = []

    func saveProduct(productName: String, calorie: String, cholesterol: String, lipid: String, natrium: String, potassium: String, protein: String) async throws {
        do {
            let ref = try await db.collection("product").addDocument(data: [
                "createAt": FieldValue.serverTimestamp(),
                "productName": productName,
                "calorie": calorie,
                "cholesterol": cholesterol,
                "lipid": lipid,
                "natrium": natrium,
                "potassium": potassium,
                "protein": protein,
            ])
            print("Document added with ID: \(ref.documentID)")
        } catch {
            print("Error adding document: \(error)")
        }
    }

    func ProductLister(){
        db.collection("product").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }

            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }

            for document in documents {
                let source = document.metadata.hasPendingWrites ? "Local" : "Server"

                //Firestoreから取得したドキュメントをMemoインスタンスに変換し、memosに格納
                self.products = documents.map { document in
                    let data = document.data()
                    return Product(documentId: document.documentID,
                                   productName: data["productName"] as? String ?? "",
                                   calorie: data["calorie"] as? String ?? "",
                                   cholesterol: data["cholesterol"] as? String ?? "",
                                   lipid: data["lipid"] as? String ?? "",
                                   natrium: data["natrium"] as? String ?? "",
                                   potassium: data["potassium"] as? String ?? "",
                                   protein: data["protein"] as? String ?? "",
                                   createAt: data["createAt"] as? Timestamp ?? Timestamp())
                }
            }
        }
    }
}

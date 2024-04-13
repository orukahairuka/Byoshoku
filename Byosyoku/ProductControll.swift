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
    let calorie: String
    let cholesterol: String
    let lipid: String
    let natrium: String
    let potassium: String
    let protein: String
    let createAt: Timestamp

    enum CodingKeys: String, CodingKey {
        case documentId
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

    func saveProduct(calorie: String, cholesterol: String, lipid: String, natrium: String, potassium: String, protein: String) async throws {
        do {
            let ref = try await db.collection("product").addDocument(data: [
                "createAt": FieldValue.serverTimestamp(),
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
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let totalResultsAvailable, totalResultsReturned, firstResultsPosition: Int
    let request: Request
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable, Identifiable {
    let id = UUID() // Add this line
    let index: Int
    let name, description, headLine: String
    let url: String
    let inStock: Bool
    let code: String
    let condition: Condition
    let imageID: String
    let image: Image
    let review: HitReview
    let affiliateRate: Double
    let price, premiumPrice: Int
    let premiumPriceStatus: Bool
    let premiumDiscountRate: Int?
    let premiumDiscountType: String?
    let priceLabel: PriceLabel
    let point: Point
    let shipping: Shipping
    let genreCategory: GenreCategory
    let parentGenreCategories: [GenreCategory]
    let brand: Brand
    let parentBrands: [Brand]
    let janCode, payment: String
    let releaseDate: JSONNull?
    let seller: Seller
    let delivery: Delivery

    enum CodingKeys: String, CodingKey {
        case index, name, description, headLine, url, inStock, code, condition
        case imageID = "imageId"
        case image, review, affiliateRate, price, premiumPrice, premiumPriceStatus, premiumDiscountRate, premiumDiscountType, priceLabel, point, shipping, genreCategory, parentGenreCategories, brand, parentBrands, janCode, payment, releaseDate, seller, delivery
    }
}
// MARK: - Brand
struct Brand: Codable {
    let id: Int?
    let name: String
}

enum Condition: String, Codable {
    case new = "new"
}

// MARK: - Delivery
struct Delivery: Codable {
    let deadLine, day: Int?
    let area: String
}

// MARK: - GenreCategory
struct GenreCategory: Codable {
    let id: Int
    let name: String
    let depth: Int
}

// MARK: - Image
struct Image: Codable {
    let small, medium: String
}

// MARK: - Point
struct Point: Codable {
    let amount, times, bonusAmount, bonusTimes: Int
    let premiumAmount, premiumTimes, premiumBonusAmount, premiumBonusTimes: Int
}

// MARK: - PriceLabel
struct PriceLabel: Codable {
    let taxable: Bool
    let defaultPrice: Int
    let discountedPrice: JSONNull?
    let fixedPrice: Int?
    let premiumPrice: JSONNull?
    let periodStart: Int?
    let periodEnd: JSONNull?
}

// MARK: - HitReview
struct HitReview: Codable {
    let count: Int
    let url: String
    let rate: Double
}

// MARK: - Seller
struct Seller: Codable {
    let sellerID, name: String
    let url: String
    let isBestSeller: Bool
    let review: SellerReview
    let imageID: String

    enum CodingKeys: String, CodingKey {
        case sellerID = "sellerId"
        case name, url, isBestSeller, review
        case imageID = "imageId"
    }
}

// MARK: - SellerReview
struct SellerReview: Codable {
    let rate: Double
    let count: Int
}

// MARK: - Shipping
struct Shipping: Codable {
    let code: Int
    let name: Name
}

enum Name: String, Codable {
    case 条件付き送料無料 = "条件付き送料無料"
    case 設定なし = "設定なし"
    case 送料無料 = "送料無料"
}

// MARK: - Request
struct Request: Codable {
    let query: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


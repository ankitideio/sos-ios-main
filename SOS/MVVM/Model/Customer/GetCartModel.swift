//
//  GetCartModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 02/05/23.
//

import Foundation
import UIKit
// MARK: - GetCartModel
struct GetCartModel: Codable {
    let status, message: String
    let statusCode: Int
    let data: GetCartData
}

// MARK: - DataClass
struct GetCartData: Codable {
    let cart: [Cart]
}

// MARK: - Cart
struct Cart: Codable {
    let id, userID: String
    let productID: ProductIdCart
    let quantity, totalPrice: Int
    let isBlocked, isDeleted: Bool
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID = "userId"
        case productID = "productId"
        case quantity, totalPrice, isBlocked, isDeleted, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - ProductID
struct ProductIdCart: Codable {
    let id, productName: String
    let productThumbnail: String
    let price, discountPrice, reviewCount: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productName, productThumbnail, price, discountPrice, reviewCount
    }
}


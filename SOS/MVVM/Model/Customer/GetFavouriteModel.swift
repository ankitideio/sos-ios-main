//
//  GetFavouriteModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 26/04/23.
//

import Foundation
import UIKit
// MARK: - GetFavouriteModel
struct GetFavouriteModel: Codable {
    let status, message: String
    let statusCode: Int
    let data: GetFavouriteData
}

// MARK: - DataClass
struct GetFavouriteData: Codable {
    let favourite: [Favourite]
}

// MARK: - Favourite
struct Favourite: Codable {
    let id, userID: String
    let productID: ProductID
    let isBlocked, isDeleted: Bool
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID = "userId"
        case productID = "productId"
        case isBlocked, isDeleted, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - ProductID
struct ProductID: Codable {
    let id, productName: String
    let productThumbnail: String
    let price, discountPrice, reviewCount: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productName, productThumbnail, price, discountPrice, reviewCount
    }
}

//
//  ProductDetailModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 26/04/23.
//

import Foundation
import UIKit


// MARK: - Welcome
struct ProductDetailModel: Codable {
    let status, message: String
    let statusCode: Int
    let data: ProductDetailData
}

// MARK: - DataClass
struct ProductDetailData: Codable {
    let products: Products
    let productList: [ProductList]
}

// MARK: - ProductList
struct ProductList: Codable {
    let id, productName, description: String
    let productThumbnail: String
    let productImages: [String]
    let price, discountPrice: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productName, description, productThumbnail, productImages, price, discountPrice
    }
}

// MARK: - Products
struct Products: Codable {
    let id, userID, categoryID, productName: String
    let description: String
    let productThumbnail: String
    let productImages: [String]
    let price, discountPrice, quantity, reviewCount: Int
    let isStatus, isBlocked, isDeleted: Bool
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID = "userId"
        case categoryID = "categoryId"
        case productName, description, productThumbnail, productImages, price, discountPrice, quantity, reviewCount, isStatus, isBlocked, isDeleted, createdAt, updatedAt
        case v = "__v"
    }
}

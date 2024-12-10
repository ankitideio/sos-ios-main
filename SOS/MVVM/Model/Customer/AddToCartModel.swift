//
//  AddToCartModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 01/05/23.
//

import Foundation
import UIKit
// MARK: - AddToCartModel
struct AddToCartModel: Codable{
    let status, message: String
    let statusCode: Int
    let data: AddToCartData
}

// MARK: - DataClass
struct AddToCartData: Codable {
    let cartItem: CartItem
}

// MARK: - CartItem
struct CartItem: Codable {
    let productID: String
    let quantity, totalPrice: Int
    let isBlocked, isDeleted: Bool
    let id, createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case quantity, totalPrice, isBlocked, isDeleted
        case id = "_id"
        case createdAt, updatedAt
        case v = "__v"
    }
}


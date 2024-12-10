//
//  HomeModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 20/04/23.
//

import Foundation
import UIKit
// MARK: - HomeModel
struct HomeModel: Codable {
    let status, message: String
    let statusCode: Int
    let data: HomeModelData
}

// MARK: - DataClass
struct HomeModelData: Codable {
    let getBanner: [GetBanner]
    let ourServices: [OurService]
    let ourProduct: [OurProduct]
}

// MARK: - GetBanner
struct GetBanner: Codable {
    let id, image: String
    let link: String
    let status, isDefault, isDeleted: Bool
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image, link, status, isDefault, isDeleted, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - OurProduct
struct OurProduct: Codable {
    let id, productName, description: String
    let productThumbnail: String
    let productImages: [String]
    let price, discountPrice: Int
    let isFavourite, isCart: Bool

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case productName, description, productThumbnail, productImages, price, discountPrice, isFavourite, isCart
    }
}

// MARK: - OurService
struct OurService: Codable {
    let id, serviceName, description: String
    let serviceImages: [String]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case serviceName, description, serviceImages
    }
}

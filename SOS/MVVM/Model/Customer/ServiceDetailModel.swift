//
//  ServiceDetailModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 27/04/23.
//

import Foundation
import UIKit
// MARK: - ServiceDetailModel
struct ServiceDetailModel: Codable {
    let status, message: String
    let statusCode: Int
    let data: ServiceDetailData
}

// MARK: - DataClass
struct ServiceDetailData: Codable {
    let service: [Service]
}

// MARK: - Service
struct Service: Codable {
    let id, iAmA, specialize, profession: String
    let specialty: [String]
    let serviceName, serviceType, price: String
    let discountPrice: Int
    let durationTime: String
    let isDuration: IsDuration
    let userID: UserID
    let description: String
    let serviceImages: [String]
    let timings: [Timing]
    let servicesWomen, servicesMen, servicesKids, servicesHairColor: [String]
    let servicesHighlights: [String]
    let categoryID: String
    let totalRating: Int
    let isFeatured: Bool
    let noOfPurchased: Int
    let isStatus, isBlocked, isDeleted: Bool
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case iAmA, specialize, profession, specialty, serviceName, serviceType, price, discountPrice, durationTime, isDuration
        case userID = "userId"
        case description, serviceImages, timings, servicesWomen, servicesMen, servicesKids, servicesHairColor, servicesHighlights
        case categoryID = "categoryId"
        case totalRating, isFeatured, noOfPurchased, isStatus, isBlocked, isDeleted, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - IsDuration
struct IsDuration: Codable {
    let initial, processing, finishing, cleanUp: String
}

// MARK: - Timing
struct Timing: Codable {
    let day, startTime, endTime, id: String

    enum CodingKeys: String, CodingKey {
        case day, startTime, endTime
        case id = "_id"
    }
}

// MARK: - UserID
struct UserID: Codable {
    let id, name, address: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, address
    }
}


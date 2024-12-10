//
//  BsignUpModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 19/04/23.
//

import Foundation
import UIKit
// MARK: - BsignUpModel
struct BsignUpModel: Codable {
    let status, message: String
    let statusCode: Int
    let data: BsignUpData
}

// MARK: - DataClass
struct BsignUpData: Codable {
    let token: String
    let user: BusinessUser
}

// MARK: - User
struct BusinessUser: Codable {
    let role, name, lastname, mobile: String
    let email: String
    let businessname, address, city, state: String?
    let zip, gender, dob, about: String?
    let question: String
//    let latitude, longitude: String
    let password, fcmToken: String
    let isMobileVerified, isBlocked, isDeleted: Bool
    let id, createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case role, name, lastname, mobile, email, businessname, address, city, state, zip, gender, dob, about, question, password, fcmToken, isMobileVerified, isBlocked, isDeleted
        case id = "_id"
        case createdAt, updatedAt
        case v = "__v"
    }
}

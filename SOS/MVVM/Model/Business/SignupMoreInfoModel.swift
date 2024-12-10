//
//  SignupMoreInfoModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 03/05/23.
//

import Foundation
import UIKit
// MARK: - SignupMoreInfoModel
struct SignupMoreInfoModel: Codable {
    let status, message: String
    let statusCode: Int
    let data: SignupMoreInfoData
}

// MARK: - DataClass
struct SignupMoreInfoData: Codable {
    let user: UserMoreInfo
}

// MARK: - User
struct UserMoreInfo: Codable {
    let id, role, name, lastname: String
    let mobile, email: String
    let businessname, address, city, state: String?
    let zip, gender, dob, about: String?
    let question: String
    let latitude, longitude: Double
    let password, fcmToken: String
    let isMobileVerified, isBlocked, isDeleted: Bool
    let createdAt, updatedAt: String
    let v: Int
    let token: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case role, name, lastname, mobile, email, businessname, address, city, state, zip, gender, dob, about, question, latitude, longitude, password, fcmToken, isMobileVerified, isBlocked, isDeleted, createdAt, updatedAt
        case v = "__v"
        case token
    }
}

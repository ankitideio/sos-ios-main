//
//  LogInModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 18/04/23.
//

import Foundation
import UIKit
//// MARK: - LogInModel
//struct LogInModel: Codable {
//    let status, message: String?
//    let statusCode: Int?
//    let data: LogInData?
//}
//
//// MARK: - DataClass
//struct LogInData: Codable {
//    let token: String?
//    let user: UserLogin?
//}
//
//// MARK: - User
//struct UserLogin: Codable {
//    let id, role, name: String?
//    let lastname: String?
//    let email: String?
//    let address: String?
//    let city, gender, dob, about: String?
//    let question: String?
//    let latitude, longitude: Int?
//    let password, fcmToken: String?
//    let isMobileVerified, isBlocked, isDeleted: Bool?
//    let createdAt, updatedAt: String?
//    let v: Int?
//    let profileImage: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case role, name, lastname, email, address, city, gender, dob, about, question, latitude, longitude, password, fcmToken, isMobileVerified, isBlocked, isDeleted, createdAt, updatedAt
//        case v = "__v"
//        case profileImage
//    }
//}

// MARK: - LogInModel
struct LogInModel: Codable {
    let status, message: String
    let statusCode: Int
    let data: LogInData
}

// MARK: - LogInModel
struct LogInData: Codable {
    let token: String
    let user: UserDetail
}

// MARK: - User
struct UserDetail: Codable {
    let id, role, name: String
    let email: String
    let businessname, address, city, state: String?
    let zip, gender, dob, about: String?
    let latitude, longitude: Double
    let password, fcmToken: String
    let isMobileVerified, isBlocked, isDeleted: Bool
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case role, name, email, businessname, address, city, state, zip, gender, dob, about, latitude, longitude, password, fcmToken, isMobileVerified, isBlocked, isDeleted, createdAt, updatedAt
        case v = "__v"
    }
}

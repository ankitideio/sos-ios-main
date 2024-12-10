//
//  SignUpModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 18/04/23.
//

import Foundation
import UIKit

// MARK: - SignUpModel
struct SignUpModel: Codable {
    let status, message: String?
    let statusCode: Int?
    let data: SignUpData?
}

// MARK: - SignUpData
struct SignUpData: Codable {
    let token: String?
    let user: User?
}

// MARK: - User
struct User: Codable {
    let role, name: String?
    let lastname: String?
    let email: String?
    let address, city, gender, dob: String?
    let about, question: String?
    let latitude, longitude: Int?
    let password, fcmToken: String?
    let isMobileVerified, isBlocked, isDeleted: Bool?
    let id, createdAt, updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case role, name, lastname, email, address, city, gender, dob, about, question, latitude, longitude, password, fcmToken, isMobileVerified, isBlocked, isDeleted
        case id = "_id"
        case createdAt, updatedAt
        case v = "__v"
    }
}


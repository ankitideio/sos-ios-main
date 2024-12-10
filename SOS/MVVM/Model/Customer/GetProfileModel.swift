//
//  GetProfileModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 24/04/23.
//

import Foundation
// MARK: - GetProfileModel
struct GetProfileModel: Codable {
    let status, message: String?
    let statusCode: Int?
    let data: ProfileModelData?
}

// MARK: - DataClass
struct ProfileModelData: Codable {
    let user: UserProfile?
}

// MARK: - User
struct UserProfile: Codable {
    let id, name, email: String?
    let address, city, gender, dob: String?
    let about: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, email, address, city, gender, dob, about
    }
}

//
//  ForgotPasswordModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 18/04/23.
//

import Foundation
import UIKit

// MARK: - ForgotPasswordModel
struct ForgotPasswordModel: Codable {
    let status, message: String?
    let statusCode: Int?
    let data: ForgotPasswordData?
}

// MARK: - DataClass
struct ForgotPasswordData: Codable {
    let token, otp: String?
}

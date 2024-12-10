//
//  MyAccountDataModel.swift
//  SOS
//
//  Created by IDEIO SOFT on 06/04/23.
//

import Foundation
import UIKit
struct MyAccountDataModel{
    var headerTitle: String?
    var accountData: [MyAccountData]?
    init(headerTitle: String? = nil, accountData: [MyAccountData]? = nil) {
        self.headerTitle = headerTitle
        self.accountData = accountData
    }
}
struct MyAccountData{
    var lblTitle: String?
    var imgIcon: String?
    init(lblTitle: String? = nil, imgIcon: String? = nil) {
        self.lblTitle = lblTitle
        self.imgIcon = imgIcon
    }
}

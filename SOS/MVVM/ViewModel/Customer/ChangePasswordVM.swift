//
//  ChangePasswordVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 28/04/23.
//

import Foundation
import UIKit
class ChangePasswordVM{
    func chnagePasswordAPI(oldPassword: String,newPassword: String,confirmPAssword: String,onSuccess:@escaping(()->())){
        let param: parameters = ["oldPassword": oldPassword,"newPassword": newPassword,"confirmPassword": confirmPAssword]
        print(param)
        WebService.service(API.changePassword, param: param,service: .put){ (model:CommonModel,jsonData,jsonSer) in
            showSwiftyAlert("", model.message, false)
            onSuccess()
        }
    }
}

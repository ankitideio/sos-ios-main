//
//  ResetPasswordVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 19/04/23.
//

import Foundation
import UIKit
class ResetPasswordVM{
    func ResetPasswordAPI(newPassword: String,confirmPAssword: String,onSuccess:@escaping(()->())){
        let param: parameters = ["token": Store.authKey ?? "","password": newPassword,"confirmPassword": confirmPAssword]
        print(param)
        WebService.service(API.reSetPassword, param: param,service: .post){ (model:ResetPasswordModel,jsonData,jsonSer) in
            
        }
    }
}

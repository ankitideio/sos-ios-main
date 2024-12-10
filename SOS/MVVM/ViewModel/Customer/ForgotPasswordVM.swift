//
//  ForgorPasswordVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 18/04/23.
//

import Foundation
import UIKit
class ForgotPasswordVM{
    func ForgotPasswordApi(email:String,onSuccess:@escaping((ForgotPasswordData?)->())){
        let param: parameters = ["email": email]
            print(param)
            WebService.service(API.forgotPassword,param: param,service: .post) { (model:ForgotPasswordModel,jsonData,jsonSer) in
                onSuccess(model.data)
            }
        }
     
}

//
//  SignUpVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 18/04/23.
//

import Foundation
import UIKit
class SignUpVM{
    func signupApi(name:String,email:String,password:String,fcmToken: String, role: String,onSuccess: @escaping((SignUpData?)->())){
        let param: parameters = ["name": name,"email":email,"password": password,  "fcmToken": fcmToken,"role": role]
            print(param)
        WebService.service(API.signUp,param: param,service: .post){(model:SignUpModel,jsonData,jsonSer) in
            Store.authKey = model.data?.token ?? ""
            onSuccess(model.data)
        }
        }
    }
        
        
        
        


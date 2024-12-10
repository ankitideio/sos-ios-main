//
//  LogInVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 18/04/23.
//

import Foundation
import UIKit
class LogInVM{
    func userLoginApi(email: String,password: String,fcmToken: String,onSuccess:@escaping((LogInData?)->())){
        let param: parameters = ["email":email,"password":password,"fcmToken": fcmToken]
        print(param)
        WebService.service(API.login,param: param,service: .post) { (model:LogInModel,jsonData,jsonSer) in
            Store.authKey = model.data.token 
            Store.userId = model.data.user.id 
            print(Store.authKey ?? "")
            Store.autoLogin = true
            onSuccess(model.data)
        }
    }
}

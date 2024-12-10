//
//  BsignUpVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 19/04/23.
//

import Foundation
import UIKit
class BsignUpVM{
func businessSignUpApi(firstName:String,lastName:String,email:String,latitude:Double, longitude:Double,password:String,mobile:String,question:String,fcmToken:String,role: String,onSuccess: @escaping((BsignUpData?)->())){
        let param: parameters = ["firstname": firstName,"lastname": lastName,"email": email,"latitude": latitude,"longitude": longitude,"password": password,"mobile": mobile,"question": question,"fcmToken": "for ios,android and web",role: "business"]
        WebService.service(API.businessSignup,param: param,service: .post){(model:BsignUpModel,jsonData,jsonSer) in
            Store.authKey = model.data.token
            Store.businessUserDetails = model.data
            onSuccess(model.data)
        }
    }
    func businessSignUpMoreInfoApi(businessName:String,profileImage:UIImage,city:String,address:String,zip:String,onSuccess: @escaping((SignupMoreInfoData?)->())){
        let param: parameters = ["businessName": businessName,"profileImage": profileImage,"city": city,"address": address,"zip": zip]
        WebService.service(API.businessSignup,param: param,service: .put){(model:SignupMoreInfoModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
        }
    }

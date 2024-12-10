//
//  FavouriteProductsVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 25/04/23.
//

import Foundation
import UIKit
class FavouriteProductsVM{
    func addToFavouriteApi(productid:String, onSuccess:@escaping(()->())){
        let param: parameters = ["userId": Store.userId ?? "","productId": productid]
        print(param)
        WebService.service(API.addToFavourite,param: param,service: .post) { (model:CommonModel,jsonData,jsonSer) in
            showSwiftyAlert("", model.message, true)
            onSuccess()
        }
    }
    func deletefavouriteByProducttIdApi(productid:String, onSuccess:@escaping(()->())){
        let param: parameters = ["productId": productid]
        print(param)
        WebService.service(API.deletefavouriteByProducttId,urlAppendId: productid,service: .delete) { (model:CommonModel,jsonData,jsonSer) in
            showSwiftyAlert("", model.message, true)
            onSuccess()
        }
    }
    func getFavouriteApi(onSuccess:@escaping((GetFavouriteData)->())){
        WebService.service(API.getFavourite,service: .get){ (model:GetFavouriteModel,jsonData,jsonSer) in
            onSuccess(model.data)
                }
    }
}

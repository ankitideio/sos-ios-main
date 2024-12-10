//
//  AddToCartVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 01/05/23.
//

import Foundation
import UIKit

class AddToCartVM{
    func addToCartApi(productId: String,type: String,quantity: Int,onSuccess:@escaping(()->())){
        let param: parameters = ["productId": productId,"type": type,"quantity":quantity]
        print(param)
      WebService.service(API.addToCart,param: param,service: .post){ (model:CommonModel,jsonData,jsonSer) in
          if type == "add"{
              showSwiftyAlert("", model.message, true)
          }else{
              showSwiftyAlert("", model.message, true)
          }
                  onSuccess()
              }
          }
    func getCartApi(onSuccess:@escaping((GetCartData)->())){
        WebService.service(API.getCart,service: .get){ (model:GetCartModel,jsonData,jsonSer) in
            onSuccess(model.data)
                }
    }
}

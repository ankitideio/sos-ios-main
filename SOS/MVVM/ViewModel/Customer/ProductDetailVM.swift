//
//  ProductDetailVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 26/04/23.
//

import Foundation
import UIKit
class ProductDetailVM{
    func productDetailApi(productid:String, onSuccess:@escaping((ProductDetailData?)->())){
        let param: parameters = ["productId": productid]
        print(param)
        WebService.service(API.productDetail,urlAppendId: productid,service: .get) { (model:ProductDetailModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
}

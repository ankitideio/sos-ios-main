//
//  ServiceDetailVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 27/04/23.
//

import Foundation
import UIKit
class ServiceDetailVM{
    func ServiceDetailApi(serviceid:String,onSuccess:@escaping((ServiceDetailData?)->())){
        WebService.service(API.serviceDetail,urlAppendId: serviceid,service: .get){ (model:ServiceDetailModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
}

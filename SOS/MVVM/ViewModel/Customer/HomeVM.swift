//
//  HomeVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 20/04/23.
//

import Foundation
import UIKit
class HomeVM{
  func mainHomeApi(onSuccess:@escaping((HomeModelData?)->())){
    WebService.service(API.mainHome,service: .get){ (model:HomeModel,jsonData,jsonSer) in
                onSuccess(model.data)
        
            }
        }
}

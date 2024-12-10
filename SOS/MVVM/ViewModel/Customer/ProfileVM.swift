//
//  ProfileVM.swift
//  SOS
//
//  Created by IDEIO SOFT on 24/04/23.
//

import Foundation
import UIKit

class ProfileVM{
    func getProfileApi(onSuccess:@escaping((ProfileModelData?)->())){
        WebService.service(API.getProfile,service: .get){ (model:GetProfileModel,jsonData,jsonSer) in
            onSuccess(model.data)
        }
    }
    func uploadProfilePicApi(profileImg: UIImageView,onSuccess:@escaping(()->())){
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.fullDate.rawValue
        let date = formatter.string(from: Date())
//        let imageInfo : ImageStructInfo
//        imageInfo = ImageStructInfo.init(fileName: "Img\(date).jpeg", type: "jpeg", data: profileImg.image?.toData() ?? Data(), key: "profileImage")
        // Convert the object to a dictionary
        let imageInfo = ImageStructInfo(fileName: "Img\(date).jpeg", type: "jpeg", data: profileImg.image?.toData() ?? Data(), key: "profileImage")

        // Convert the object to a dictionary
        do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(imageInfo)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

        // Include the dictionary in the JSON payload for the request
        let payload = [
            "image": dictionary
        ]
//        let jsonEncoder = JSONEncoder()
//        do {
//            let jsonData = try jsonEncoder.encode("\(imageInfo)")
//            let jsonString = String(data: jsonData, encoding: .utf8)
//            guard let json = jsonString else{return}


            let param: parameters = ["image": payload]

            print(param)
        WebService.service(API.ProfilePictureUpload,param: param,service:.post){ (model:GetProfileModel,jsonData,jsonSer) in
                showSwiftyAlert("Success", model.message ?? "" , true)
                onSuccess()
            }
        }
        catch
        {
            print("Error serializing data to JSON: \(error.localizedDescription)")
        }
    }
}


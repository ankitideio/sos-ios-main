//
//  Store.swift
//  Fiterit
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Gurindercql. All rights reserved.
//

import Foundation

class Store {
    class var autoLogin: Bool{
        set{
            Store.saveValue(newValue, .autoLogin)
        }get{
            return Store.getValue(.autoLogin) as? Bool ?? false
        }
    }
    

    class var authKey: String?{
        set{
            Store.saveValue(newValue, .authKey)
        }get{
            return Store.getValue(.authKey) as? String
        }
    }
    class var businessSignUpDetail: [String:Any]?{
        set{
            Store.saveValue(newValue, .businessSignUpDetail)
        }get{
            return Store.getValue(.businessSignUpDetail) as? [String:Any] ?? [:]
        }
    }
    class var userId: String?{
        set{
            Store.saveValue(newValue, .userId)
        }get{
            return Store.getValue(.userId) as? String
        }
    }
    class var userLoginDetails: LogInData? {
        set{
            Store.saveUserDetails(newValue, .loginUser)
        }
        get{
            return Store.getUserDetails(.loginUser)
        }
    }
    class var userDetails: SignUpData? {
        set{
            Store.saveUserDetails(newValue, .userDetails)
        }
        get{
            return Store.getUserDetails(.userDetails)
        }
    }
    class var businessUserDetails: BsignUpData? {
        set{
            Store.saveUserDetails(newValue, .businessUserDetails)
        }
        get{
            return Store.getUserDetails(.businessUserDetails)
        }
    }
    class var businessMoreInfo: BsignUpData? {
        set{
            Store.saveUserDetails(newValue, .businessMoreInfo)
        }
        get{
            return Store.getUserDetails(.businessMoreInfo)
        }
    }
    class var deviceToken: String?{
        set{
            Store.saveValue(newValue, .deviceToken)
        }
        get{
            return Store.getValue(.deviceToken) as? String
        }
    }
  
 
    static var remove: DefaultKeys!{
        didSet{
            Store.removeKey(remove)
        }
    }
    
    //MARK:-  Private Functions
    
    private class func removeKey(_ key: DefaultKeys){
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        if key == .userDetails{
            UserDefaults.standard.removeObject(forKey: DefaultKeys.authKey.rawValue)
        }
        UserDefaults.standard.synchronize()
    }
    
    private class func saveValue(_ value: Any? ,_ key:DefaultKeys){
        var data: Data?
        if let value = value{
//            data = NSKeyedArchiver.archivedData(withRootObject: value)
            data = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
        }
        UserDefaults.standard.set(data, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    
 
    
    private class func saveUserDetails<T: Codable>(_ value: T?, _ key: DefaultKeys){
        var data: Data?
        if let value = value{
            data = try? PropertyListEncoder().encode(value)
        }
        Store.saveValue(data, key)
    }
    
    private class func getUserDetails<T: Codable>(_ key: DefaultKeys) -> T?{
        if let data = self.getValue(key) as? Data{
            let loginModel = try? PropertyListDecoder().decode(T.self, from: data)
            return loginModel
        }
        return nil
    }
    
    private class func getValue(_ key: DefaultKeys) -> Any{
        if let data = UserDefaults.standard.value(forKey: key.rawValue) as? Data{
            if let value = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            {
                return value
            }
            else{
                return ""
            }
        }else{
            return ""
        }
    }
}

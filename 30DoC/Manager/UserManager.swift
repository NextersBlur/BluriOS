//
//  UserManager.swift
//  30DoC
//
//  Created by 주정한 on 2018. 2. 16..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class UserManager: NSObject {//dont have to be nsobject but for convinience
    private static var _instance : UserManager?
    
    static var shared : UserManager {
        if _instance == nil {
            _instance = UserManager()
        }
        return _instance!
    }
    
    private let keyAppIdStored = "com.30doc.usermanager.appid"
    private let keyUserIdStored = "com.30doc.usermanager.userid"
    
    private let userDefaults = UserDefaults.standard
    
    public var appId : String {
        if let storedAppId = userDefaults.string(forKey: keyAppIdStored) {
            return storedAppId
        }
        
        let random = randomString(length: 16)
        userDefaults.set(random, forKey: keyAppIdStored)
        userDefaults.synchronize()
        return random
    }
    
    public var userId : Int {
        get {
            if let _ = userDefaults.object(forKey: keyUserIdStored) {
                return userDefaults.integer(forKey: keyUserIdStored)
            }
            return 0 // error or not set
        }
        
        set(value) {
            if value < 1 {
                return
            }
            userDefaults.set(value, forKey: keyUserIdStored)
            userDefaults.synchronize()
        }
    }
    
    public var isRegistered : Bool {
        return userId != 0
    }
    
    public func registerIfNotRegistered() {
        if isRegistered == false {
            APIConnector.shared.connectToMemberLogin(completion: { (result) in
                guard let userId = result else { // error
                    return
                }
                
                self.userId = userId
            })
        }
    }
    
    private func randomString(length: Int = 10) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}

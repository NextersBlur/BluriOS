//
//  Request.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import Foundation
import Alamofire
extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}

class Request {
    
    
    
    
    static func random(length: Int = 10) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
    
    
    
    
    static func postMyIdToServer(){
        
        let randomString = random(length: 10)
        let _ = Alamofire.request("http://13.124.185.204:8080/api/v1/member/login", method: .post, parameters: ["uniqueKey" : randomString]).response { (result) in
            switch result.response?.statusCode{
            case 200? :
                UserDefaults.standard.set(randomString, forKey: "MyID")
                UserDefaults.standard.synchronize()
            case 401?:
                print("Unauthorized")
            default:
                return
            }
        }
        
        
        
        
    }
}

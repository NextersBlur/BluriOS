//
//  NSObject+.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import Foundation
extension NSObject{
    
    public var classNameToString : String{
        return NSStringFromClass(type(of: self))
    }
    public static var classNameToString : String{
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}

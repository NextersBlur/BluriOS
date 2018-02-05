//
//  Attribute+.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import Foundation
import UIKit
extension String{
    
    func updateWithSpacing(lineSpacing: Float)-> NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString(string: self)
        let mutableParagraphStyle = NSMutableParagraphStyle()
        mutableParagraphStyle.lineSpacing = CGFloat(lineSpacing)
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: mutableParagraphStyle, range: NSMakeRange(0, self.count))
        
        return attributedString
        
    }
    
    func updateAttribute(font : String, fontSize : CGFloat, applyString: String,lineSpacing : CGFloat?)->NSMutableAttributedString{
        let attributeString = NSMutableAttributedString(string : self)
        if let lineSpacing = lineSpacing{
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            attributeString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: (self as NSString).range(of: self))
        }
        attributeString.addAttribute(.font, value: UIFont(name: font, size: fontSize), range: (self as NSString).range(of: applyString))
        
        return attributeString
    }
    
}


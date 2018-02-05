//
//  BaseNavigationController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import Foundation
import UIKit
class BaseNavigationController : UINavigationController {
    deinit {
        print("deinit : \(self)")
    }
    override func loadView() {
        super.loadView()
        self.interactivePopGestureRecognizer?.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = true
    }
}

extension BaseNavigationController : UIGestureRecognizerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true 
    }
}

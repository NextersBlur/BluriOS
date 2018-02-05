//
//  RecordingViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 2. 1..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class RecordingViewController: UIViewController {
    
    static func instance() -> RecordingViewController? {
        return UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? RecordingViewController
    }
    @IBAction func startRecordingButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}

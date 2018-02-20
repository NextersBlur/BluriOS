//
//  RecordingViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 2. 1..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit
import RNPulseButton


class RecordingViewController: UIViewController {
    
    @IBOutlet weak var recodeButtonView: RNPulseButton!
    @IBOutlet weak var recodingTimeLabel: UILabel!
    
    static func instance() -> RecordingViewController? {
        return UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? RecordingViewController
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recodeButtonView.start()
    recodeButtonView.addTarget(self, action: #selector(didRecodingButtonViewTap), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    @objc func didRecodingButtonViewTap(){
        recodeButtonView.start()
        print("a")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    @IBAction func didRecodingCancelTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didSendButtonTap(_ sender: Any) {
        
        
    }
  
    
}

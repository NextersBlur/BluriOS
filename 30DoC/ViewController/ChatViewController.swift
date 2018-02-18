//
//  ChatViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 2. 1..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    static func instance() -> ChatViewController? {
        return UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? ChatViewController
    }
    
    @IBOutlet weak var recordingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVars()
        // Do any additional setup after loading the view.
    }
    func initVars(){
       //View의 위쪽에만 선을 주고, shadow주기
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction private func StartRecordingButtonClicked(_ sender: UIButton) {
        if let viweController = RecordingViewController.instance(){
            //self.navigationController?.pushViewController(viweController, animated: true)
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = true
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.isNavigationBarHidden = false
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

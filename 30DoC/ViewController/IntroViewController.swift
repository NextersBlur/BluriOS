//
//  IntroViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var backGroundImage: UIImageView!
    static func instance() -> IntroViewController? {
        return UIStoryboard(name: "Intro", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? IntroViewController
    }
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var createQuestionButton: UIButton!
    @IBOutlet weak private var startTalkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVars()
        
    }
    func initVars(){
        createQuestionButton.layer.cornerRadius = 25
        startTalkButton.layer.cornerRadius = 25
        createQuestionButton.layer.borderColor = UIColor.white.cgColor
        createQuestionButton.layer.borderWidth = 1.0
        titleLabel.attributedText = titleLabel.text?.updateWithSpacing(lineSpacing: 8)
       
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction private func startTalkButtonClicked(_ sender: Any) {
        if let viewController = QuestionIntroViewController.instance(){
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
  
    @IBAction private func createQuestionButtonClicked(_ sender: Any) {
        if let viewController = CreateQuestionsViewController.instance(){
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

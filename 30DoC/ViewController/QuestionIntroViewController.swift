//
//  QuestionIntroViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class QuestionIntroViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    static func instance() -> QuestionIntroViewController? {
        return UIStoryboard(name: "QuestionIntro", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? QuestionIntroViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVars()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let controller = SolveQuestionsRootViewController.instance(){
               self.navigationController?.pushViewController(controller, animated: true)
            }
            
        }

    }
    func initVars(){
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Regular",size: 22.0)
        titleLabel.attributedText = titleLabel.text?.updateAttribute(font: "AppleSDGothicNeo-Bold", fontSize: 22.0, applyString: "O, X로 답해주세요.", lineSpacing: 10)
        titleLabel.textAlignment = .center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("A")
    }
    

}

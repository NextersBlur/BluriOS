//
//  CreateQuestionsViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class CreateQuestionsViewController: UIViewController {

    
    @IBOutlet weak var backGroundImageView: UIImageView!
    var tapGestureRecognizer : UITapGestureRecognizer!

    static func instance() -> CreateQuestionsViewController? {
        return UIStoryboard(name: "CreateQuestions", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? CreateQuestionsViewController
    }
    @IBOutlet weak private var questionCompleteButton: UIButton!
    @IBOutlet private var questionTextField: [UITextField]!
    @IBOutlet weak private var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        initVars()
        
        
    }
    
    func initVars(){
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 22.0)
        titleLabel.attributedText = titleLabel.text?.updateAttribute(font: "AppleSDGothicNeo-Bold", fontSize: 22.0, applyString: "영혼의 친구를 찾아드릴게요.", lineSpacing: 10)
        
        for textField in questionTextField{
            textField.setBottomBorder()
            textField.addTarget(self, action: #selector(changeTextField), for: .editingDidEnd)
        }
        
        questionCompleteButton.isEnabled = false
        tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.addTarget(self, action: #selector(tapImage))
        backGroundImageView.isUserInteractionEnabled = true
        backGroundImageView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func tapImage() {
        self.view.endEditing(true)
    }
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    @objc private func changeTextField(){
        questionCompleteButton.isEnabled = true
        
    }

    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
extension CreateQuestionsViewController : UITextFieldDelegate{
   
}

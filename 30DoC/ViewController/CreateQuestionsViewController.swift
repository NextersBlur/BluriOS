//
//  CreateQuestionsViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class CreateQuestionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
      var placeholderArr = ["맥주보다 소주가 좋다","맥주보다 소주가 좋다","맥주보다 소주가 좋다","맥주보다 소주가 좋다","맥주보다 소주가 좋다","맥주보다 소주가 좋다","맥주보다 소주가 좋다","맥주보다 소주가 좋다","맥주보다 소주가 좋다","맥주보다 소주가 좋다"]
    @IBOutlet weak var backGroundImageView: UIImageView!
    var tapGestureRecognizer : UITapGestureRecognizer!

    static func instance() -> CreateQuestionsViewController? {
        return UIStoryboard(name: "CreateQuestions", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? CreateQuestionsViewController
    }
    
    @IBOutlet weak private var questionCompleteButton: UIButton!
    @IBOutlet weak private var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "CreateQuestionTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CreateQuestionTableViewCell")
        initVars()

    }
    
    func initVars(){
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 22.0)
        titleLabel.attributedText = titleLabel.text?.updateAttribute(font: "AppleSDGothicNeo-Bold", fontSize: 22.0, applyString: "영혼의 친구를 찾아드릴게요.", lineSpacing: 10)
        
//        for textField in questionTextField{
//            textField.setBottomBorder()
//            textField.addTarget(self, action: #selector(changeTextField), for: .editingDidEnd)
//        }
        
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
        print("a")
    }
    

}
extension CreateQuestionsViewController : UITextFieldDelegate{
   
}
extension CreateQuestionsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateQuestionTableViewCell", for: indexPath) as! CreateQuestionTableViewCell
        
        cell.configure(placeholderArr[indexPath.row])
        return cell
    }
}

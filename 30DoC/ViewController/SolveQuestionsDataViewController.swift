//
//  SolveQuestionsDataViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class SolveQuestionsDataViewController: UIViewController {

    var dataObject: String = ""
    var questionTitleString = ""
    var questionCountString = ""
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var questionCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

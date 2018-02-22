//
//  AnalysisViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 2. 1..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit
import FLAnimatedImage

class AnalysisViewController: UIViewController {

    
 
    @IBOutlet weak var percentageLabel: AnimatedLabel!
    
    
    static func instance() -> AnalysisViewController? {
        return UIStoryboard(name: "Analysis", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? AnalysisViewController
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        percentageLabel.countFromZero(to: 100, duration: 10)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

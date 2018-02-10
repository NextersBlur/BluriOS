//
//  AnalysisResultViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 2. 1..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit
import FLAnimatedImage

class AnalysisResultViewController: UIViewController {

    @IBOutlet weak var backgroundImage: FLAnimatedImageView!
    
    static func instance() -> AnalysisResultViewController? {
        return UIStoryboard(name: "AnalysisResult", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? AnalysisResultViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "resultGIF", withExtension: "gif") {
            if let data = try? Data(contentsOf: url) {
                let bannerImage = FLAnimatedImage(animatedGIFData: data)
                self.backgroundImage.animatedImage = bannerImage
                
            }
        }
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

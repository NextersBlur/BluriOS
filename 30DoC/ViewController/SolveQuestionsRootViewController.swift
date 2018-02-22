//
//  SolveQuestionsViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class SolveQuestionsRootViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionProgressBar: UIProgressView!
    @IBOutlet weak var oButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    var pageViewController: UIPageViewController?
    var _modelController: ModelController? = nil

    static func instance() -> SolveQuestionsRootViewController? {
        return UIStoryboard(name: "SolveQuestions", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? SolveQuestionsRootViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPageController()
        backButton.layer.zPosition = 1
        oButton.layer.zPosition = 1
        xButton.layer.zPosition = 1
        questionLabel.layer.zPosition = 1
        
        questionProgressBar.layer.zPosition = 1
        
        questionProgressBar.transform = questionProgressBar.transform.scaledBy(x: 1, y: 8)
        questionProgressBar.progressTintColor = UIColor(red: 130/255, green: 82/255, blue: 235/255, alpha: 1)
        
        //init progress and label with first state
        passData(count: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    func initPageController(){
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let startingViewController: SolveQuestionsDataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
        self.pageViewController!.dataSource = self.modelController
        self.pageViewController?.delegate = self.modelController
        self.modelController.dataSource = self
        
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        
        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        self.pageViewController!.didMove(toParentViewController: self)
    }
    @IBAction func didBackButtonTap(_ sender: Any) {
        print("A")
        
        //지금 dataView가 root보다 다 앞에 와있어서 아무것도 터치가 안댐
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var modelController: ModelController {
        // Return the model controller object, creating it if necessary.
        // In more complex implementations, the model controller may be passed to the view controller.
        if _modelController == nil {
            _modelController = ModelController()
        }
        return _modelController!
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

extension SolveQuestionsRootViewController : QuestionDataSource{
    func passData(count: Int) {
        let pageNumber = count + 1
        questionProgressBar.progress = Float(pageNumber)/10
        questionLabel.text  = "\(pageNumber)/10"
    }
    
    
}


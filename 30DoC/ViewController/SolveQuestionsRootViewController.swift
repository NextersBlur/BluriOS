//
//  SolveQuestionsViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class SolveQuestionsRootViewController: UIViewController,UIPageViewControllerDelegate {

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
        oButton.layer.zPosition = 1
        xButton.layer.zPosition = 1
        questionLabel.layer.zPosition = 1
        
        questionProgressBar.layer.zPosition = 1
        
        questionProgressBar.transform = questionProgressBar.transform.scaledBy(x: 1, y: 8)
        questionProgressBar.progressTintColor = UIColor(red: 130/255, green: 82/255, blue: 235/255, alpha: 1)
        questionProgressBar.progress = 0.1

        // Do any additional setup after loading the view.
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
        self.pageViewController!.delegate = self
        
        let startingViewController: SolveQuestionsDataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
        self.pageViewController!.dataSource = self.modelController
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
extension SolveQuestionsRootViewController {
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .portrait) || (orientation == .portraitUpsideDown) || (UIDevice.current.userInterfaceIdiom == .phone) {
            // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to true, so set it to false here.
            let currentViewController = self.pageViewController!.viewControllers![0]
            let viewControllers = [currentViewController]
            self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
            
            self.pageViewController!.isDoubleSided = false
            return .min
        }
        
        let currentViewController = self.pageViewController!.viewControllers![0] as! SolveQuestionsDataViewController
        var viewControllers: [UIViewController]
        
        let indexOfCurrentViewController = self.modelController.indexOfViewController(currentViewController)
        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
            let nextViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerAfter: currentViewController)
            viewControllers = [currentViewController, nextViewController!]
        } else {
            let previousViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerBefore: currentViewController)
            viewControllers = [previousViewController!, currentViewController]
        }
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
        
        return .mid
    }
}
extension SolveQuestionsRootViewController : QuestionDataSource{
    func passData(count: Int) {
        
        questionProgressBar.progress = Float(Double(count)/Double(10))
        
    }
    
    
}


//
//  ModelController.swift
//  30DoC
//
//  Created by Zedd on 2018. 2. 10..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import Foundation
import UIKit
class ModelController: NSObject, UIPageViewControllerDataSource {
    
    var pageData: [String] = []
    var dataSource : QuestionDataSource?
    
    override init() {
        super.init()
        // Create the data model.
        
        for i in 0..<10 {
            pageData.append("\(i)")
        }
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> SolveQuestionsDataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "SolveQuestionsDataViewController") as! SolveQuestionsDataViewController
        dataViewController.dataObject = self.pageData[index]
        dataViewController.questionCountString = "\(index+1)"
        dataViewController.questionTitleString = self.pageData[index]
        return dataViewController
    }
    
    func indexOfViewController(_ viewController: SolveQuestionsDataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController as! SolveQuestionsDataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! SolveQuestionsDataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
}

extension ModelController : UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed && finished {
            var index : Int
            if let viewController = pageViewController.viewControllers?.last as? SolveQuestionsDataViewController {
                index = self.indexOfViewController(viewController)
            } else {
                index = 0
            }
            
            dataSource?.passData(count: index)
        }
    }
    
}


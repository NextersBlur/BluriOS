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
    
    
    override init() {
        super.init()
        // Create the data model.
        let dateFormatter = DateFormatter()
        pageData = dateFormatter.monthSymbols
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> SolveQuestionsDataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "SolveQuestionsDataViewController") as! SolveQuestionsDataViewController
        dataViewController.dataObject = self.pageData[index]
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


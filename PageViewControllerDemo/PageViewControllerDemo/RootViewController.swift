//
//  RootViewController.swift
//  Test
//
//  Created by Bas Broek on 12/2/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
  
  var pageViewController: UIPageViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    pageViewController = {
      let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
      
      guard let
        storyboard = storyboard,
        startingViewController = modelController.viewControllerAtIndex(0, storyboard: storyboard) else { return pageViewController }
      pageViewController.setViewControllers([startingViewController], direction: .Forward, animated: false, completion: nil)
      pageViewController.dataSource = modelController
      
      return pageViewController
      }()
    
    guard let pageViewController = pageViewController else { return }
    view.addSubview(pageViewController.view)
  }
  
  var modelController: ModelController {
    if _modelController == nil {
      _modelController = ModelController()
    }
    return _modelController!
  }
  
  var _modelController: ModelController?
}
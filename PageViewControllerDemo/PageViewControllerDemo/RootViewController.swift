//
//  RootViewController.swift
//  Test
//
//  Created by Bas Broek on 12/2/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

import UIKit

private let kDataViewController = "DataViewController"

class RootViewController: UIViewController {
  
  var names: [Name]!
  var name: Name!
  
  var index: Int? {
    return names.indexOf(name)
  }
  
  var pageViewController: UIPageViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    pageViewController = {
      let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
      
      guard let
        index = index,
        storyboard = storyboard,
        startingViewController = viewControllerAtIndex(index, storyboard: storyboard) else { return pageViewController }
      pageViewController.setViewControllers([startingViewController], direction: .Forward, animated: false, completion: nil)
      pageViewController.dataSource = self
      
      return pageViewController
    }()
    
    guard let pageViewController = pageViewController else { return }
    view.addSubview(pageViewController.view)
  }
}

// MARK: - Helpers
extension RootViewController {
  
  func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> DataViewController? {
    guard names.count != 0 && index < names.count else { return nil }
    
    let dataViewController: DataViewController? = {
      let dataViewController = storyboard.instantiateViewControllerWithIdentifier(kDataViewController) as? DataViewController
      dataViewController?.name = names[index]
      
      return dataViewController
    }()
    
    return dataViewController
  }
  
  func indexOfViewController(viewController: DataViewController) -> Int {
    guard let
      tip = viewController.name,
      index = names.indexOf(tip) else { return NSNotFound }
    
    return index
  }
}

// MARK: - UIPageViewControllerDataSource
extension RootViewController: UIPageViewControllerDataSource {
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    guard let
      viewController = viewController as? DataViewController,
      storyboard = viewController.storyboard else { return nil }
    var index = indexOfViewController(viewController)
    guard index != 0 && index != NSNotFound else { return nil }
    
    return viewControllerAtIndex(--index, storyboard: storyboard)
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    guard let
      viewController = viewController as? DataViewController,
      storyboard = viewController.storyboard else { return nil }
    var index = indexOfViewController(viewController)
    guard index != NSNotFound else { return nil }
    index++
    guard index != names.count else { return nil }
    
    return viewControllerAtIndex(index, storyboard: storyboard)
  }
}
//
//  ModelController.swift
//  Test
//
//  Created by Bas Broek on 12/2/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

import UIKit

private let kDataViewController = "DataViewController"

class ModelController: NSObject {
  
  var names = [
    Name(surname: "Tim",    lastname: "Cook"),
    Name(surname: "Jony",   lastname: "Ive"),
    Name(surname: "Phill",  lastname: "Schiller"),
    Name(surname: "Eddy",   lastname: "Cue")
  ]
  
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
extension ModelController: UIPageViewControllerDataSource {
  
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
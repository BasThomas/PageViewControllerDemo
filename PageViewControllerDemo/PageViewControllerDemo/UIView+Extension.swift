//
//  UIView+Extension.swift
//  PageViewControllerDemo
//
//  Created by Bas Broek on 12/2/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

import UIKit

extension UIView {
  
  var parentViewController: UIViewController? {
    var parentResponder: UIResponder? = self
    while parentResponder != nil {
      parentResponder = parentResponder?.nextResponder()
      guard let viewController = parentResponder as? RootViewController else { continue }
      return viewController
    }
    
    return nil
  }
}
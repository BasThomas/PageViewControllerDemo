//
//  GCD+Extension.swift
//  PageViewControllerDemo
//
//  Created by Bas Broek on 12/2/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

import Foundation

struct GCD {
  static func delay(delay: Double, closure: Void -> Void) {
    dispatch_after(
      dispatch_time(
        DISPATCH_TIME_NOW,
        Int64(delay * Double(NSEC_PER_SEC))
      ),
      dispatch_get_main_queue(), closure)
  }
}
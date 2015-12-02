//
//  DataViewController.swift
//  Test
//
//  Created by Bas Broek on 12/2/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
  
  @IBOutlet weak var nameLabel: UILabel!
  var name: Name?
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    nameLabel?.text = name?.fullName
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    GCD.delay(0.001) {
      self.view.parentViewController?.navigationItem.title = self.name?.fullName
    }
  }
}
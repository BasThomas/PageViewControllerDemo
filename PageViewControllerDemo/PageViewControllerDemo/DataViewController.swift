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
  @IBOutlet weak var nameImageView: UIImageView!
  var name: Name?
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    nameLabel?.text = name?.fullName
    guard let imageURL = name?.imageURL else { return }
    
    NSURLSession.sharedSession().dataTaskWithRequest(NSURLRequest(URL: imageURL)) { data, response, error in
      guard let data = data where error == nil else { return }
      dispatch_async(dispatch_get_main_queue()) {
        self.nameImageView.image = UIImage(data: data)
      }
    }.resume()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    GCD.delay(0.00001) { // ¯\_(ツ)_/¯
      self.view.parentViewController?.navigationItem.title = self.name?.fullName
    }
  }
}
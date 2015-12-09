//
//  NameTableViewCell.swift
//  PageViewControllerDemo
//
//  Created by Bas Broek on 12/8/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  var name: Name!
}

extension NameTableViewCell {
  
  func populate() {
    nameLabel.text = name.fullName
  }
}
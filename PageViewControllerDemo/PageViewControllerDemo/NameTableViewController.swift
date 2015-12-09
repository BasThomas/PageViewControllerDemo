//
//  NameTableViewController.swift
//  PageViewControllerDemo
//
//  Created by Bas Broek on 12/8/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

import UIKit

class NameTableViewController: UITableViewController {
  
  var names = [
    Name(surname: "Tim",    lastname: "Cook",     imageURL: NSURL(string: "http://images.apple.com/pr/bios/images/cook_hero.png")),
    Name(surname: "Jony",   lastname: "Ive",      imageURL: NSURL(string: "http://images.apple.com/pr/bios/images/ive_hero20110204.png")),
    Name(surname: "Phill",  lastname: "Schiller", imageURL: NSURL(string: "http://images.apple.com/pr/bios/images/schiller_hero20110204.png")),
    Name(surname: "Eddy",   lastname: "Cue",      imageURL: NSURL(string: "http://images.apple.com/pr/bios/images/1501cue_hero.png"))
  ]
}

// MARK: - UITableViewDataSource
extension NameTableViewController {
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
  }
  
  override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    guard let cell = cell as? NameTableViewCell else { return }
    cell.name = names[indexPath.row]
    cell.populate()
  }
}

// MARK: - Navigation
extension NameTableViewController {
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    guard let
      destination = segue.destinationViewController as? RootViewController,
      cell = sender as? NameTableViewCell else { return }
    destination.names = names
    destination.name = cell.name
  }
}
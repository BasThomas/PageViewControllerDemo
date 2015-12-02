//
//  Tip.swift
//  Test
//
//  Created by Bas Broek on 12/2/15.
//  Copyright © 2015 Bas Broek. All rights reserved.
//

import Foundation

struct Name {
  var surname: String
  var lastname: String
  
  var fullName: String {
    return "\(surname) \(lastname)"
  }
}

extension Name: Equatable { }
func ==(lhs: Name, rhs: Name) -> Bool {
  return lhs.surname == rhs.surname && lhs.lastname == rhs.lastname
}
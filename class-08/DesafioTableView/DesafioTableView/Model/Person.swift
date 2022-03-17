//
//  Person.swift
//  DesafioTableView
//
//  Created by Giovanna Moeller on 16/03/22.
//

import Foundation
import UIKit

struct Person {
  var color: UIColor {
    let colors: [UIColor] = [.systemIndigo, .systemRed, .systemBlue, .systemCyan, .systemMint, .systemPink, .systemTeal, .systemBrown, .systemGreen, .systemPurple, .systemOrange, .systemOrange]
    return colors.randomElement() ?? colors[0]
  }
  var name: String
  var age: Int
  var role: String
}

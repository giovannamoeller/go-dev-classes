//
//  CellTableViewCell.swift
//  DesafioTableView
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class CellTableViewCell: UITableViewCell {
  
  static var identifier = "CellTableViewCell"
  private var person: Person?
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var roleAgeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setPerson(person: Person) {
    self.person = person
    backgroundColor = person.color
    nameLabel.text = person.name
    roleAgeLabel.text = "\(String(describing: person.role)) - \(String(describing: person.age))"
  }
  
}

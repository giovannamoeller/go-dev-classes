//
//  CustomTableViewCell.swift
//  Challenge
//
//  Created by Giovanna Moeller on 21/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  static let identifier = "CustomTableViewCell"
  
  @IBOutlet weak var personImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var companyLabel: UILabel!
  
  override func layoutSubviews() {
    super.layoutSubviews()
    personImage.layer.cornerRadius = 8.0
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setUp(person: Person) {
    nameLabel.text = person.name
    companyLabel.text = person.company.name
    personImage.downloadImage(from: person.photo)
  }
}

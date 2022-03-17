//
//  CustomTableViewCell.swift
//  Challenge
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  static let identifier = "CustomTableViewCell"
  
  @IBOutlet weak var carroImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setUp(carro: String) {
    nameLabel.text = carro
  }
  
}

//
//  CustomTableViewCell.swift
//  TableViewCustomCell
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  private var movieModel = MovieModel()
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setup(logo: String, name: String, description: String) {
    movieModel.setImage(url: logo, imageView: logoImageView)
    nameLabel.text = name
    descriptionLabel.text = description
  }
}

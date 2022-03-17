//
//  CustomCollectionViewCell.swift
//  Challenge
//
//  Created by Giovanna Moeller on 17/03/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var categoryName: UILabel!
  static let identifier = "CustomCollectionViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    configureUI()
  }
  
  func configureUI() {
    contentView.layer.borderWidth = 1.5
    contentView.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 0.3)
    contentView.layer.cornerRadius = 8.0
  }
  
  func setUp(category: String) {
    categoryName.text = category
  }
  
}

//
//  CustomTableViewCell.swift
//  Challenge
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  static let identifier = "CustomTableViewCell"
  
  @IBOutlet weak var movieImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var yearLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    configureUI()
  }
  
  func configureUI() {
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    movieImageView.layer.cornerRadius = 8.0
  }
  
  func setUp(movie: Movie) {
    nameLabel.text = movie.name
    yearLabel.text = movie.year
    movieImageView.image = UIImage(named: movie.image)
  }
  
}

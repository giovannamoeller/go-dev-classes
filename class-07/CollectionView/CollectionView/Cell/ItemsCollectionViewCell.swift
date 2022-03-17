//
//  ItemsCollectionViewCell.swift
//  CollectionView
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
  
  static var identifier = "ItemsCollectionViewCell"
  @IBOutlet weak var imageView: UIImageView!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  func setup() {
    
  }
  
}

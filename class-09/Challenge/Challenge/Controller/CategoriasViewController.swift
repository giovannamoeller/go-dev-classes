//
//  CategoriasViewController.swift
//  Challenge
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class CategoriasViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var collections = ["Action", "Drama", "Romance", "Fiction", "Adventure", "Science"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNib()
    collectionView.delegate = self
    collectionView.dataSource = self
    configureLayout()
    // Do any additional setup after loading the view.
  }
  
  func configureLayout() {
    let layout = UICollectionViewFlowLayout()
    let padding: CGFloat = 48
    let size = collectionView.frame.size.width - padding
    layout.itemSize = CGSize(width: size / 2, height: size / 2)
    layout.minimumLineSpacing = 30.0
    collectionView.collectionViewLayout = layout
  }
  
  func registerNib() {
    let nib = UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
  }
}

extension CategoriasViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collections.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
    cell?.setUp(category: collections[indexPath.row])
    return cell ?? UICollectionViewCell()
  }
}

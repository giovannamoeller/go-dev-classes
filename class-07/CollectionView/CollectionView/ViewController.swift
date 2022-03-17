//
//  ViewController.swift
//  CollectionView
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  
  var names = ["Gi", "La", "Ba", "a", "e"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNib()
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionLayout()
  }
  
  private func registerNib() {
    let nib = UINib(nibName: ItemsCollectionViewCell.identifier, bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: ItemsCollectionViewCell.identifier)
  }
  
  private func collectionLayout() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 90, height: 90)
    layout.minimumLineSpacing = 10
    layout.scrollDirection = .horizontal
    collectionView.collectionViewLayout = layout
  }

}

extension ViewController: UICollectionViewDelegate,
                          UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Cliquei no index \(indexPath.row)")
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return names.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemsCollectionViewCell.identifier, for: indexPath) as? ItemsCollectionViewCell
    cell?.contentView.backgroundColor = .red
    return cell ?? UICollectionViewCell()
    
  }
  
  
}

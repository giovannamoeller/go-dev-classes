//
//  CategoriasViewController.swift
//  Challenge
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class CategoriasViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    configureLayout()
    // Do any additional setup after loading the view.
  }
  
  func configureLayout() {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 140, height: 90)
    collectionView.collectionViewLayout = layout
  }
}

extension CategoriasViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath)
    //cell.contentView.backgroundColor = .red
    return cell
  }
}

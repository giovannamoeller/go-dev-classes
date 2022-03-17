//
//  HomeViewController.swift
//  Challenge
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNib()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func registerNib() {
    let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
  }
  
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
    cell?.setUp(movie: MoviesLibrary.movies[indexPath.row])
    return cell ?? UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MoviesLibrary.movies.count
  }
  
}

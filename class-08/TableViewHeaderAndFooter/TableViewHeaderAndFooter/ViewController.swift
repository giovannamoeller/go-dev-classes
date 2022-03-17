//
//  ViewController.swift
//  TableViewHeaderAndFooter
//
//  Created by Giovanna Moeller on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureDelegates()
    registerCell()
    configureUI()
  }
  
  func configureDelegates() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func configureUI() {
    let header = UIView(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: 200))
    let footer = UIView(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: 200))
    
    header.backgroundColor = .red
    header.backgroundColor = .blue
    
    tableView.tableHeaderView = header
    tableView.tableFooterView = footer
  }
  
  private func registerCell() {
    let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
  }


}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
    return cell
  }
}

extension ViewController: UITableViewDelegate {
}


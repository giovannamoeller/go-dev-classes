//
//  ViewController.swift
//  Challenge
//
//  Created by Giovanna Moeller on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
  
  private var APIService = API()
  var people: [Person] = []

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    configureNib()
    configureUI()
  }
  
  func configureUI() {
    APIService.getData { people in
      self.people = people
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  func configureNib() {
    let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
  }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
    cell?.setUp(person: people[indexPath.row])
    return cell ?? UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
}


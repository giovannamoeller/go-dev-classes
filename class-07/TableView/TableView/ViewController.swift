//
//  ViewController.swift
//  TableView
//
//  Created by Giovanna Moeller on 16/03/22.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 30
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // células reutilizáveis
    cell.textLabel?.text = "Giovanna"
    cell.detailTextLabel!.text = "Person"
    return cell
  }
  
  
}


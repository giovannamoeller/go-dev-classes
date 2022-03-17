//
//  ViewController.swift
//  DesafioTableView
//
//  Created by Giovanna Moeller on 15/03/22.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var people: [Person] = [
    .init(name: "Giovanna", age: 21, role: "iOS Developer"),
    .init(name: "Lucas", age: 19, role: "Doctor"),
    .init(name: "Peter", age: 22, role: "Actor"),
    .init(name: "Roger", age: 25, role: "Web Developer"),
    .init(name: "Devan", age: 26, role: "Scrum Master"),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    registerNib()
    configureDelegates()
    configureUI()
  }
  
  private func configureDelegates() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  private func configureUI() {
    title = "Pessoas legais"
    navigationItem.backButtonTitle = "Voltar"
    navigationController?.navigationBar.tintColor = .systemIndigo
  }
  
  private func registerNib() {
    tableView.register(.init(nibName: CellTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CellTableViewCell.identifier)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == DetailsViewController.segueIdentifier {
      if let details = segue.destination as? DetailsViewController {
        if let person = sender as? Person {
          details.setPerson(person)
        }
      }
    }
  }
}

extension ViewController: UITableViewDelegate,
                          UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let person = people[indexPath.row]
    performSegue(withIdentifier: DetailsViewController.segueIdentifier, sender: person)
    tableView.deselectRow(at: indexPath, animated: true)
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellTableViewCell.identifier, for: indexPath) as? CellTableViewCell
    cell?.setPerson(person: people[indexPath.row])
    return cell ?? UITableViewCell()
  }
  
}

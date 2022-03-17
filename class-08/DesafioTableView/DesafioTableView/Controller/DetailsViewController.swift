//
//  DetailsViewController.swift
//  DesafioTableView
//
//  Created by Giovanna Moeller on 15/03/22.
//

import UIKit

class DetailsViewController: UIViewController {
  
  private var person: Person?
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var roleLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  
  static let segueIdentifier = "moveToDetailsPage"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  private func configureUI() {
    nameLabel.text = person?.name
    roleLabel.text = person?.role
    ageLabel.text = String(person?.age ?? 0)
  }
  
  func setPerson(_ person: Person) {
    self.person = person
  }
  
}

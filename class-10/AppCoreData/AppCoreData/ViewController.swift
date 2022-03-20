//
//  ViewController.swift
//  AppCoreData
//
//  Created by Giovanna Moeller on 17/03/22.
//

import UIKit

class ViewController: UIViewController {
  
  let managedObjectContext = ManagedObjectContext()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func registerButton(_ sender: Any) {
    let person = Person(id: UUID(), name: "Giovanna", lastName: "Moeller", age: 21)
    managedObjectContext.savePerson(person: person) { string in
      print(string)
    }
  }
  
  @IBAction func getUserButton(_ sender: Any) {
    let person = managedObjectContext.getPerson(id: UUID(uuidString: "09619D19-F787-432A-93F4-36054908E404") ?? UUID())
    print(person)
  }
  
  @IBAction func getAllUsersButton(_ sender: Any) {
    let people = managedObjectContext.getAllPeople()
    print(people)
  }
  
  @IBAction func deleteUserButton(_ sender: Any) {
    managedObjectContext.deletePerson(id: UUID(uuidString: "09619D19-F787-432A-93F4-36054908E404") ?? UUID()) { string in
      print(string)
    }
  }
  
}


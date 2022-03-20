//
//  ManagedObjectContext.swift
//  AppCoreData
//
//  Created by Giovanna Moeller on 17/03/22.
//

import Foundation
import UIKit
import CoreData

typealias onCompletionHandler = (String) -> Void

protocol ManagedSavedProtocol {
  func savePerson(person: Person, onCompletionHandler: onCompletionHandler)
}

protocol ManagedGetProtocol {
  func getPerson(id: UUID) -> Person
  func getAllPeople() -> [Person]
}

protocol ManagedDeleteProtocol {
  func deletePerson(id: UUID, onCompletionHandler: onCompletionHandler)
}


class ManagedObjectContext {
  static let entity: String = "Users"
  func getContext() -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
  }
}

extension ManagedObjectContext: ManagedSavedProtocol {
  func savePerson(person: Person, onCompletionHandler: onCompletionHandler) {
    
    let context = getContext()
            
    guard let entity = NSEntityDescription.entity(forEntityName: ManagedObjectContext.entity, in: context) else { return }
    
    let transaction = NSManagedObject(entity: entity, insertInto: context)
    
    transaction.setValue(person.id, forKey: "id")
    transaction.setValue(person.name, forKey: "name")
    transaction.setValue(person.lastName, forKey: "lastName")
    transaction.setValue(person.age, forKey: "age")
    
    do {
      try context.save()
      onCompletionHandler("Success")
    } catch let error as NSError {
      print("Error: \(error.localizedDescription)")
    }
  }
}

extension ManagedObjectContext: ManagedGetProtocol {
  func getPerson(id: UUID) -> Person {
    
    let people = getAllPeople()
    
    let personIndex = people.firstIndex { person in
      person.id == id
    }
    
    if let personIndex = personIndex {
      return people[personIndex]
    } else {
      return Person(id: UUID(), name: "Giovanna", lastName: "Moeller", age: 21)
    }
  }
  
  func getAllPeople() -> [Person] {
    
    var allPeople: [Person] = []
    
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: ManagedObjectContext.entity)
    
    do {
      guard let people = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return allPeople }
      
      for item in people {
        if let id = item.value(forKey: "id") as? UUID,
           let name = item.value(forKey: "name") as? String,
           let lastName = item.value(forKey: "lastName") as? String,
           let age = item.value(forKey: "age") as? Int {
          let person = Person(id: id, name: name, lastName: lastName, age: age)
          allPeople.append(person)
        }
      }
            
    } catch let error as NSError {
      print(error)
    }
    
    return allPeople
  }
}

extension ManagedObjectContext: ManagedDeleteProtocol {
  func deletePerson(id: UUID, onCompletionHandler: (String) -> Void) {
    let context = getContext()
    
    let predicate = NSPredicate(format: "id == %@", "\(id)")
    
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: ManagedObjectContext.entity)
    fetchRequest.predicate = predicate
    
    do {
      let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
      
      if let entityDelete = fetchResults.first {
        context.delete(entityDelete)
      }
      try context.save()
      onCompletionHandler("Delete success")
    } catch let error as NSError {
      print(error.localizedDescription)
    }
  }
}

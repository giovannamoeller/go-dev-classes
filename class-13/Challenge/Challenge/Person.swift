//
//  Person.swift
//  Challenge
//
//  Created by Giovanna Moeller on 21/03/22.
//

import Foundation

struct Person: Codable {
  var id: Int
  var name: String
  var photo: String
  var company: Company
  
  init(id: Int, name: String, photo: String, company: Company) {
    self.id = id
    self.name = name
    self.photo = photo
    self.company = company
  }
}

struct Company: Codable {
  var name: String
}

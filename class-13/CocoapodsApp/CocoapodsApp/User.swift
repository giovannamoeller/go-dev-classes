//
//  User.swift
//  CocoapodsApp
//
//  Created by Giovanna Moeller on 21/03/22.
//

import Foundation

struct User: Codable {
  var login: String
  var avatar_url: String
  var name: String
  var company: String
  var followers: Int
  var following: Int
  
  init(login: String, avatar_url: String, name: String, company: String, followers: Int, following: Int) {
    self.login = login
    self.avatar_url = avatar_url
    self.name = name
    self.company = company
    self.followers = followers
    self.following = following
  }
}

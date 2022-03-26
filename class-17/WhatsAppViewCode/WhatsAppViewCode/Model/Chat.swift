//
//  Chat.swift
//  WhatsAppViewCode
//
//  Created by Giovanna Moeller on 25/03/22.
//

import Foundation

struct Chat {
  
  static var chats: [Chat] {
    return [
      Chat(userName: "Giovanna", message: "Hey, how are you?"),
      Chat(userName: "Sarah", message: "Are you working with iOS Development?"),
      Chat(userName: "Brunna", message: "I'll be there at 7PM."),
      Chat(userName: "Leticia", message: "Miss ya <3"),
      Chat(userName: "Yara", message: "On my way!!!"),
    ]
  }
  
  let userName: String
  let message: String
  let profilePic: String = "person"
}

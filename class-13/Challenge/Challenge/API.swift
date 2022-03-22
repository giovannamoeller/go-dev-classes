//
//  API.swift
//  Challenge
//
//  Created by Giovanna Moeller on 21/03/22.
//

import Foundation

class API {
  let URLString = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
  
  func getData(completionHandler: @escaping ([Person]) -> Void) {
    guard let URL = URL(string: URLString) else { return }
    
    let task = URLSession.shared.dataTask(with: URL, completionHandler: { (data, response, error) in
      if let error = error {
        print("Erro ao consumir: \(error)")
        return
      }
      
      if let data = data,
         let people = try? JSONDecoder().decode([Person].self, from: data) {
        completionHandler(people)
      }
    })
    task.resume()
  }
}

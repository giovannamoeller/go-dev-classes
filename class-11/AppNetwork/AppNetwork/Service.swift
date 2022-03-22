//
//  Service.swift
//  AppNetwork
//
//  Created by Giovanna Moeller on 22/03/22.
//

import Foundation

enum UserError: Error {
  case urlInvalid
  case noProcessData
  case noDataAvailable
}

protocol ServiceProtocol {
  
  func getUsers(completion: @escaping(Result<[User], UserError>) -> Void)
  
}

class Service: ServiceProtocol {
  
  let session = URLSession.shared
  let url = "https://run.mocky.io/v3/30e27c3a-2d1f-4ecf-9e5e-f6773519bab6"
  
  static var shared: Service = {
    let instance = Service()
    return instance
  }()
  
  func getUsers(completion: @escaping(Result<[User], UserError>) -> Void) {
    
    guard let url = URL(string: url) else { return completion(.failure(.urlInvalid)) }
    
    let dataTask = session.dataTask(with: url) { data, _ , _ in
      
      do {
        
        guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
        
        let decoder = JSONDecoder()
        
        let userResponse = try decoder.decode([User].self, from: jsonData)
        
        completion(.success(userResponse))
        
        
      } catch {
        completion(.failure(.noProcessData))
      }
      
    }
    
    dataTask.resume()
  }
  
}

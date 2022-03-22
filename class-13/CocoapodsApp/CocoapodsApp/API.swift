//
//  API.swift
//  CocoapodsApp
//
//  Created by Giovanna Moeller on 21/03/22.
//

import Foundation
import UIKit

class API {
  let URLString = "https://api.github.com/users/giovannamoeller"
  func getData(completionHandler: @escaping (User) -> Void) {
    guard let URL = URL(string: URLString) else { return }
    let task = URLSession.shared.dataTask(with: URL, completionHandler: { (data, response, error) in
      if let error = error {
        print("Erro ao consumir: \(error)")
        return
      }
      if let data = data,
         let user = try? JSONDecoder().decode(User.self, from: data) {
        completionHandler(user)
      }
    })
    task.resume()
  }
  
  func getImage(imgView: UIImageView, urlString: String) {
    let url = URL(string: urlString)
    imgView.kf.setImage(with: url)
  }
}

//
//  API.swift
//  CocoapodsApp
//
//  Created by Giovanna Moeller on 21/03/22.
//

import Foundation
import UIKit
import Alamofire

class API {
  let URLString = "https://api.github.com/users/giovannamoeller"
  func getData(completionHandler: @escaping (User) -> Void) {
    
    let request = AF.request(URLString)
    
    request.responseDecodable(of: User.self) { response in
      guard let user = response.value else { return }
      completionHandler(user)
    }
  }
  
  func getImage(imgView: UIImageView, urlString: String) {
    let url = URL(string: urlString)
    imgView.kf.setImage(with: url)
  }
}

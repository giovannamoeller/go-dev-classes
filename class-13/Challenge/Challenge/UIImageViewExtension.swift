//
//  UIImageViewExtension.swift
//  Challenge
//
//  Created by Giovanna Moeller on 21/03/22.
//

import Foundation
import UIKit

extension UIImageView {
  
  func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
  }
  
  func downloadImage(from url: String) {
    print("Download Started")
    guard let url = URL(string: url) else { return }
    getData(from: url) { data, response, error in
      guard let data = data, error == nil else { return }
      print(response?.suggestedFilename ?? url.lastPathComponent)
      print("Download Finished")
      DispatchQueue.main.async() { [weak self] in
        self?.image = UIImage(data: data)
      }
    }
  }
}

//
//  Movie.swift
//  TableViewCustomCell
//
//  Created by Giovanna Moeller on 16/03/22.
//

import Foundation
import UIKit
import Kingfisher

struct Movie {
  var name: String
  var year: String
  var image: String
}

struct MovieModel {
  static var movies: [Movie] = [
    .init(name: "Spider Man", year: "2021", image: "https://i0.wp.com/www.otakupt.com/wp-content/uploads/2021/11/Spider-Man-No-Way-Home-poster.jpg?resize=696%2C870&ssl=1"),
    .init(name: "Batman", year: "2022", image: "https://rollingstone.uol.com.br/media/uploads/the-batman-robert-pattinson-trailer-dc-reproducao.jpg"),
    .init(name: "Avengers Endgame", year: "2019", image: "https://i.pinimg.com/736x/92/c8/e0/92c8e00b34fcfdeaf605a0647c21adb3.jpg"),
    .init(name: "Avengers Infinity Way", year: "2018", image: "https://moviesense.files.wordpress.com/2018/04/avengers-infinity-war.jpg")
  ]
  
  func setImage(url: String, imageView: UIImageView) {
    let url = URL(string: url)
    imageView.kf.setImage(with: url)
  }
}

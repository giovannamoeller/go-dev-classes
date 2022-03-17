//
//  Movie.swift
//  Challenge
//
//  Created by Giovanna Moeller on 17/03/22.
//

import Foundation

struct Movie {
  var name: String
  var year: String
  var image: String
}

struct MoviesLibrary {
  static let movies: [Movie] = [
    .init(name: "Spider Man - No Way Home", year: "2021", image: "spider-man"),
    .init(name: "Batman", year: "2022", image: "batman"),
    .init(name: "Suicide Squad", year: "2021", image: "suicide-squad"),
    .init(name: "Scream", year: "2022", image: "scream"),
    .init(name: "Avengers - Endgame", year: "2019", image: "avengers"),
  ]
}

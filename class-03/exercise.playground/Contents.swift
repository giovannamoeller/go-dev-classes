import UIKit

func palindromo(str: String) -> Bool {
  let caracteres: [Character] = str.lowercased().map { $0 }
  var caracteresReversed: [Character] = caracteres
  caracteresReversed.reverse()
  return caracteres == caracteresReversed
}

palindromo(str: "ovo")
palindromo(str: "giovanna")

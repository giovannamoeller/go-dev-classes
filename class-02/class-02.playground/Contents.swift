import UIKit

// MARK: Opcionais

var message: String?
message = "Minha mensagem"
print(message ?? "Olá!")
message = nil
print(message ?? "Tudo bem?")

if let message = message {
  print(message)
}

if message != nil {
  print(message!) // force unwrap
} else {
  print("Vish, to nulo")
}

// MARK: Functions

func icon() -> UIImage {
  guard let image = UIImage(named: "photo") else {
    return UIImage(systemName: "house")!
  }
  return image
}
icon()

func someFunc(parameter: String?) {
  guard let parameter = parameter else {
    return
  }
  print(parameter)
}
someFunc(parameter: "Giovanna")

func getUser(name: String?) -> String {
  if let name = name {
    return name
  }
  return "default"
}
getUser(name: nil)
getUser(name: "gimoeller")

// Func Override

func myCar() {
  print("Meu carro")
}

func myCar(name: String) {
  print("Meu carro é: \(name)")
}

func myCar(name: String, year: Int) {
  print("Meu carro é: \(name), do ano: \(year)")
}

myCar()
myCar(name: "BMW")
myCar(name: "BMW", year: 2020)

// Função com retorno

func getName(name: String) -> String {
  let users = ["Giovanna", "Andre", "João", "Lucas"]
  
  if users.contains(name) {
    return name
  }
  return "Usuário não encontrado"
}
getName(name: "Giovanna")
getName(name: "Ana")

// MARK: Closures

typealias Person = (String, String, Int) -> (String, String, Int)

let getPerson: Person = { (name, lastName, age) in
  return (name, lastName, age)
}

let person = getPerson("Giovanna", "Moeller", 21)
person.0
person.1
person.2

typealias onCompletion = (Int) -> Void

func makeBuy(value: Int, onCompletion: onCompletion) {
  onCompletion(value)
}

makeBuy(value: 20) { value in
  print("You bought something of \(value) dollars")
}

typealias onCompletionSuccess = (String) -> Void
typealias onCompletionError = (String) -> Void

func makeBuyProduct(isValid: Bool,
                    onCompletion: onCompletionSuccess,
                    onCompletionError: onCompletionError) { // boa prática de organização
  if isValid {
    onCompletion("Giovanna")
  } else {
    onCompletionError("Error")
  }
}

makeBuyProduct(isValid: true, onCompletion: { success in
  print("Sucesso: \(success)")
}, onCompletionError: { error in
  print("Error: \(error)")
})

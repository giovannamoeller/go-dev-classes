import UIKit

// MARK: Classes e Structs

class Person {
  var name: String
  var lastName: String
  
  init(name: String, lastName: String) {
    self.name = name
    self.lastName = lastName
  }
  
  func welcome() {
    print("Bem-vindo(a), \(name) \(lastName)")
  }
}

let person = Person(name: "Giovanna", lastName: "Moeller")
person.name = "Gigi"
print(person.name)

// Struct: passagem por valor, não precisa de inicializador, não pode herdar outras structs/classes, apenas conformar a protocolos

class CustomButton: UIButton {
  
}

let button: CustomButton = .init(type: .system)
// Todas as propriedades do UIButton + CustomButton

// MARK: Herança

class Animal {
  
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func comer(comida: String) {
    print("O animal \(name) está comendo \(comida).")
  }
}

class Dog: Animal {
  func latir() {
    print("Au au")
  }
}

let binha = Dog(name: "Binha")
binha.latir()
binha.comer(comida: "Ração")

// MARK: Extensões

// São muito poderosas, podemos adicionar funcionalidades a uma classe/tipo específico, além de ajudar muito na organização do código, podemos utilizar extensões para utilizar protocolos como delegate, por exemplo

protocol Nota {
  func notaAluno()
}

protocol Materia {
  func materiaAluno()
}

class Aluno {
  var name: String?
  
  func getName() -> String {
    guard let name = name else { return "" }
    return name
  }
}

extension Aluno {
  func setName(name: String) {
    self.name = name
  }
}

extension Aluno: Nota {
  func notaAluno() {
    print("Nota")
  }
  
}

extension Aluno: Materia {
  func materiaAluno() {
    print("Matéria")
  }
  
}

let aluno1 = Aluno()
aluno1.getName()
aluno1.setName(name: "Giovanna")
aluno1.getName()

class ViewController: UITableViewController {
  let table = UITableView(frame: .zero, style: .plain)
}

extension String {
  func capitalizeFirst() -> String {
    return prefix(1).capitalized + dropFirst()
  }
}

let name = "giovanna"
print(name.capitalizeFirst())

extension UIImage {
  static let appleLogo = UIImage(systemName: "applelogo")
}
UIImage.appleLogo

let lightBlue: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)

// MARK: Protocolos

protocol ReformarCampo {
  func plantarNovaGrama()
  func pintarNovasLinhas()
}

class Empresa: ReformarCampo {
  func plantarNovaGrama() {
    // contratar empregados
    // fazer os empregados plantarem grama
  }
  
  func pintarNovasLinhas() {
    // contratar empregados
    // fazer os empregados pintarem as linhas
  }
}

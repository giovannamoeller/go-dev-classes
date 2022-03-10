import UIKit

// MARK: Switch

let nota = 4

switch nota {
case 0:
  print("Você precisa estudar")
case 1...5:
  print("Você está abaixo da média")
case 6...10:
  print("Você está acima da média")
default:
  print("Erro")
}

// MARK: Enum

enum Aluno {
  case Giovanna
  case Pedro
  case Andre
}

let aluno = Aluno.Andre
let aluna: Aluno = .Giovanna
print(aluna)

enum Dinheiro: Double {
  case umCentavo = 0.01
  case cincoCentavos = 0.05
  case dezCentavos = 0.1
  case vinteCincoCentavos = 0.25
  case cinquentaCentavos = 0.5
  case umReal = 1.0
}

let valor: Double = Dinheiro.cincoCentavos.rawValue + Dinheiro.dezCentavos.rawValue
print(valor)

var valor2: Dinheiro = .umReal

switch valor2 {
case .umCentavo: print("Um centavo")
case .cincoCentavos: print("Cinto centavos")
case .dezCentavos: print("Dez centavos")
case .vinteCincoCentavos: print("Vinte e cinco centavos")
case .cinquentaCentavos: print("Cinquenta centavos")
case .umReal: print("Um real")
}

enum State { // muito usado em requisições da API
  case Success
  case Error
  case Loading
}

let state: State = .Success // retorna de uma API

switch state { // a partir daqui, normalmente chamamos uma view
case .Success: print("Sucesso na requisição!")
case .Error: print("Erro na requisição!")
case .Loading: print("Loading...")
}


enum Texts: String {
  case titleButton = "Nome do Botão"
  case titleLabel = "Nome da Label"
}

let button = UIButton()
button.setTitle(Texts.titleButton.rawValue, for: .normal)

let label = UILabel()
label.text = Texts.titleLabel.rawValue

enum Page: Int {
  case one = 1, two, three, four, five, six
  
  func getPage() -> Int {
    return self.rawValue
  }
}

let page = Page.two
print(page.getPage())

enum BankDeposit {
  case inValue(Int)
  case inCheck(Bool)
}

func makeDeposit(values: BankDeposit) {
  switch values {
  case .inValue(let value):
    print("O valor passado é: \(value)")
  case .inCheck(let isCheck):
    print("In Check: \(isCheck)")
  }
}

makeDeposit(values: .inValue(200))
makeDeposit(values: .inCheck(true))

// MARK: Programação Funcional

// o swift não é 100% funcional, mas permite várias funcionalidades que nos permitem utilizar desse paradigma

var estudantes = ["Giovanna", "Lucas", "Felipe", "André", "João"]
estudantes.last
estudantes.first
estudantes.sort() // ordem alfabética

estudantes.sort { (lhs: String, rhs: String) -> Bool in
  // lhs = left hand side = lado esquerdo
  // rhs = right hand side = lado direito
  lhs > rhs // ordenado de forma decrescente
}
print(estudantes)

let ascending = estudantes.sorted(by: <)
print(ascending)

let array1 = [1, 2, 3, 4]
let array2 = [5, 6, 7, 8]
array1 + array2

// Map

let array3 = array1.map { value in
  value * 2
}

let array4 = array1.map { $0 + 1 }

// Filter

var alunosNotas: [Double] = [6.6, 8.2, 4.5, 6.4, 8.9, 5.0, 4.5, 7.2]
var aprovadosNotas: [Double] = []
for nota in alunosNotas {
  if nota >= 6 {
    aprovadosNotas.append(nota)
  }
}

print(aprovadosNotas)

aprovadosNotas = alunosNotas.filter({ nota in
  nota >= 6
})
aprovadosNotas = alunosNotas.filter({ $0 > 6.0 })
print(aprovadosNotas)

// Reduce

var soma = 0
var notas = [4, 5, 6, 8, 10]

for nota in notas {
  soma += nota
}

print(soma)

let somaReduce = notas.reduce(0) { total, nota in
  total + nota
}
print(somaReduce)

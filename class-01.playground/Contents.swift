import UIKit

// MARK: Variáveis

var greeting = "Hello, playground"
let name = "Giovanna" // constantes
// name = "Arthur"
greeting = "Hello!"
print(greeting)

// MARK: Concatenação

print("Meu nome é " + name + " !")
print("Meu nome é \(name)!")


// MARK: Tipos de variáveis

let idade: Int = 21
var ano = 2022
var valor = 20.25
var ehAdulto: Bool = true

// MARK: Incrementos, Operadores lógicos

let num1 = 20
let num2 = 10

let compair = num1 > num2
print(compair)

"Giovanna" > "Ana" // true, porque G vem depois do A
"Beatriz" > "Lucio" // false porque B vem antes do L

// Operadores
3 == 3
2 == 3
2 != 3
2 > 3
2 < 3
3 >= 3
3 <= 2

// Expressões

let isHidden: Bool = false
let isEnable: Bool = true

!isHidden
isEnable && isHidden
isHidden || isEnable
isHidden && isEnable || 10 < 50

// Incrementos

var numIncremento = 10
numIncremento -= 1
numIncremento += 1
numIncremento = numIncremento + 1

// MARK: Condicionais

if isHidden || 20 < 10 {
  print("Caso verdadeiro")
} else if isEnable {
  print("Caso verdadeiro: isEnable")
} else {
  print("Caso falso")
}

var system: String
let company: String = "Apple"

system = company == "Apple" ? "iOS" : "Android"

// MARK: Arrays

//var cars = ["Fusca", "Ferrari", "Audi", "Celta", 83] as [Any]
var anyArray: [Any] = [23, 32, "Giovanna"]
var cars = ["Fusca", "Ferrari", "Audi", "Celta"]
cars.append("BMW")
cars.insert("Peugeot 208", at: 3)
cars.removeLast() // conceito de programação funcional
cars.count

typealias carsType = String

var cars2: [carsType] = ["BMW", "Audi", "Corolla"]
print(cars2)

// MARK: Dicionarios

var pessoas: [String: Int] = [
  "Giovanna": 21,
  "Joao": 24,
  "Ana": 25
]
print(pessoas)

var pessoa: [String: Any] = [
  "name": "Giovanna",
  "age": 21,
  "email": "giovannagmoeller@gmail.com"
]

print(pessoa["name"] ?? "default")

var todasPessoas: [[String: Any]] = [
  [
  "name": "Joao",
  "age": 25,
  "email": "joao@gmail.com"
  ],
  [
  "name": "Felipe",
  "age": 25,
  "email": "felipe@gmail.com"
  ],
  [
  "name": "Andre",
  "age": 19,
  "email": "andre@gmail.com"
  ],
]
todasPessoas[0]["name"]
todasPessoas[1]["name"]

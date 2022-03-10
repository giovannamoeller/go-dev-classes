import UIKit

struct Stack {
  
  var array: [Int] = []
  
  mutating func createArray(arr: [Int]) {
    array = arr
  }
  
  mutating func addElement(_ element: Int) {
    array.insert(element, at: 0)
  }
  
  mutating func removeElement() {
    array.removeFirst()
  }
  
  func getArray() -> [Int] {
    return array
  }
  
}

var stack = Stack()
stack.createArray(arr: [1, 2, 3, 4])
stack.addElement(5)
stack.addElement(7)
stack.removeElement()
print(stack.getArray())

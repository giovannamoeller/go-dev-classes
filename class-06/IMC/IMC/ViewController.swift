//
//  ViewController.swift
//  IMC
//
//  Created by Giovanna Moeller on 15/03/22.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var heightTextField: UITextField!
  @IBOutlet weak var calculateButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    
    weightTextField.delegate = self
    heightTextField.delegate = self // Assinamos o contrato
  }
  
  func configureUI() {
    calculateButton.layer.cornerRadius = 8.0
    
  }

  @IBAction func calculateButtonPressed(_ sender: Any) {
    
    if let height = Double(heightTextField.text ?? "") {
      if let weight = Double(weightTextField.text ?? "") {
        showResult(imc: calculateIMC(weight: weight, height: height / 100))
      }
    }
  }
  
  
  private func calculateIMC(weight: Double, height: Double) -> Double {
    return (weight / (height * height))
  }
  
  private func showResult(imc: Double) {
    let alert = UIAlertController(title: "Resultado", message: "Seu IMC é de \(imc.rounded())", preferredStyle: .alert)
    alert.addAction(.init(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
  private func showError() {
    let alert = UIAlertController(title: "Erro", message: "Não foi possível calcular o IMC. Tente novamente.", preferredStyle: .alert)
    alert.addAction(.init(title: "OK", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}


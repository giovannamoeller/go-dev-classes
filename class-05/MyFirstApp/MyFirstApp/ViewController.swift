//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Giovanna Moeller on 14/03/22.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signInButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  func configureUI() {
    signInButton.layer.cornerRadius = 12.0
    
    [emailTextField, passwordTextField].forEach { textField in
      textField?.textColor = .white
      textField?.backgroundColor = .white.withAlphaComponent(0.1)
      textField?.layer.cornerRadius = 8.0
      textField?.leftView = .init(frame: .init(x: 0, y: 0, width: 16, height: 0))
      textField?.leftViewMode = .always
    }
    
    emailTextField.keyboardType = .emailAddress
    passwordTextField.isSecureTextEntry = true
  }

  @IBAction func signInButtonPressed(_ sender: Any) {
    
    let email = emailTextField.text
    let password = passwordTextField.text
    
    if email != "" && password != "" {
      auth(email: email!, password: password!)
    } else {
      authFailed()
    }
     
    /*if let email = emailTextField.text,
       let password = passwordTextField.text {
      auth(email: email, password: password)
    } else {
      authFailed()
    }*/
  }
  
  private func auth(email: String, password: String) {
    let alert = UIAlertController(title: "Login", message: "User \(email) has just signed in!", preferredStyle: .actionSheet)
    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  private func authFailed() {
    let alert = UIAlertController(title: "Login", message: "Login failed. Please try again.", preferredStyle: .actionSheet)
    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
}


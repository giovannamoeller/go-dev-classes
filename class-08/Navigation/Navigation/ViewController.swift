//
//  ViewController.swift
//  Navigation
//
//  Created by Giovanna Moeller on 17/03/22.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "First VC"
  }
  
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    navigationItem.backButtonTitle = "Back"
    navigationController?.navigationBar.tintColor = .yellow
    performSegue(withIdentifier: "moveToSecondVC", sender: nil)
    //navigationController?.pushViewController(SecondViewController(), animated: true)
    
  }
}


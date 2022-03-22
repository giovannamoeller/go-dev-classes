//
//  ViewController.swift
//  CocoapodsApp
//
//  Created by Giovanna Moeller on 21/03/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
  
  var user: User?
  var APIService = API()

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var loginLabel: UILabel!
  @IBOutlet weak var followersLabel: UILabel!
  @IBOutlet weak var followingLabel: UILabel!
  @IBOutlet weak var userImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    callAPI()
  }
  
  func callAPI() {
    APIService.getData { user in
      DispatchQueue.main.async {
        self.user = user
        self.configureUI()
      }
    }
  }
  
  func configureUI() {
    userImageView.layer.cornerRadius = userImageView.bounds.width / 2
    nameLabel.text = user?.name
    loginLabel.text = user?.login
    followersLabel.text = "\(user?.followers ?? 0) Followers"
    followingLabel.text = "\(user?.following ?? 0) Following"
    APIService.getImage(imgView: userImageView, urlString: user?.avatar_url ?? "")
  }

}


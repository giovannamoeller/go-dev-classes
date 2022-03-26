//
//  MainTabBar.swift
//  WhatsAppViewCode
//
//  Created by Giovanna Moeller on 25/03/22.
//

import UIKit

class MainTabBar: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
  }
  
  private func configureTabBar() {
    
    tabBar.backgroundColor = .gray.withAlphaComponent(0.1)
    tabBar.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
    tabBar.layer.borderWidth = 1.0
    tabBar.bounds = view.frame.inset(by: .init(top: -6.0, left: 0, bottom: 0, right: 0))
    
    let statusVC = UIViewController()
    let callsVC = UIViewController()
    let cameraVC = UIViewController()
    let chatsVC = ChatViewController()
    let settingsVC = UIViewController()
    
    viewControllers = [
      embedInNavigationController(vc: statusVC, title: "Status", image: "circle.dashed", selectedImage: "circle.dashed.inset.filled"),
      embedInNavigationController(vc: callsVC, title: "Calls", image: "phone", selectedImage: "phone.fill"),
      embedInNavigationController(vc: cameraVC, title: "Camera", image: "camera", selectedImage: "camera.fill"),
      embedInNavigationController(vc: chatsVC, title: "Chats", image: "bubble.left.and.bubble.right", selectedImage: "bubble.left.and.bubble.right.fill"),
      embedInNavigationController(vc: settingsVC, title: "Settings", image: "gearshape", selectedImage: "gearshape.fill")
    ]
    
    
  }
  
  private func embedInNavigationController(vc: UIViewController, title: String, image: String, selectedImage: String) -> UIViewController {
    let nav = UINavigationController(rootViewController: vc)
    nav.tabBarItem.title = title
    nav.tabBarItem.image = UIImage(systemName: image)
    nav.tabBarItem.selectedImage = UIImage(systemName: selectedImage)
    return nav
  }
}

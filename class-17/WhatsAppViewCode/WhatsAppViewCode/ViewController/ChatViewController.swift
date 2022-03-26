//
//  ViewController.swift
//  WhatsAppViewCode
//
//  Created by Giovanna Moeller on 25/03/22.
//

import UIKit

class ChatViewController: UIViewController {
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.delegate = self
    tableView.dataSource = self
    addSubviews()
    configureUI()
    configureConstraints()
  }
  
  private func configureUI() {
    title = "Chat"
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: nil)
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
    
  }
  
  private func addSubviews() {
    view.addSubview(tableView)
  }
  
  private func configureConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  
  /*@objc private func rightBarButtonTapped() {
    
  }*/


}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Chat.chats.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
    cell.accessoryType = .disclosureIndicator
    cell.setChat(chat: Chat.chats[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let destinationVC = ChatDetailsViewController()
    destinationVC.chat = Chat.chats[indexPath.row]
    navigationController?.pushViewController(destinationVC, animated: true)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}

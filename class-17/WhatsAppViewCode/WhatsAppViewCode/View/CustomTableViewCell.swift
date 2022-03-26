//
//  CustomTableViewCell.swift
//  WhatsAppViewCode
//
//  Created by Giovanna Moeller on 25/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  static let identifier = "CustomTableViewCell"
  
  private lazy var userImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    imageView.clipsToBounds = true
    return imageView
  }()
  
  private lazy var userName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16.0, weight: .bold)
    return label
  }()
  
  private lazy var message: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 13.0, weight: .regular)
    return label
  }()
  
  private lazy var userAndMessageStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    [userName, message].forEach { view in
      stackView.addArrangedSubview(view)
    }
    stackView.axis = .vertical
    stackView.alignment = .leading
    stackView.distribution = .fill
    stackView.spacing = 8.0
    return stackView
  }()
  
  private lazy var chatStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    [userImage, userAndMessageStackView].forEach { view in
      stackView.addArrangedSubview(view)
    }
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .fill
    stackView.spacing = 16.0
    return stackView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
    configureConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    addSubview(chatStackView)
  }
  
  private func configureConstraints() {
          
    NSLayoutConstraint.activate([
      userImage.heightAnchor.constraint(equalToConstant: 48.0),
      userImage.widthAnchor.constraint(equalToConstant: 48.0),
      
      chatStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
      chatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
      chatStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
    ])
    
    DispatchQueue.main.async {
      self.userImage.layer.cornerRadius = self.userImage.frame.width / 2
    }
  }
  
  func setChat(chat: Chat) {
    userImage.image = UIImage(named: chat.profilePic)
    userName.text = chat.userName
    message.text = chat.message
  }
  
}

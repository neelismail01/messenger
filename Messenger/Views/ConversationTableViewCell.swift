//
//  ConversationTableViewCell.swift
//  Messenger
//
//  Created by Neel Ismail on 2021-12-24.
//

import UIKit
import SDWebImage

class ConversationTableViewCell: UITableViewCell {
    
    static let identifier = "ConversationTableViewCell"

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let userNameCircle: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        return view
    }()
    
    private let userNameInitialsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold )
        label.numberOfLines = 0
        return label
    }()
    
    private let userMessageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // contentView.addSubview(userImageView)
        
        contentView.addSubview(userNameCircle)
        userNameCircle.addSubview(userNameInitialsLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userMessageLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /*
         userImageView.frame = CGRect(x: 10,
                                     y: 10,
                                     width: 80,
                                     height: 80)
         */
        
        
        userNameCircle.frame = CGRect(x: 10,
                                      y: 10,
                                      width: 50,
                                      height: 50)
        
        userNameInitialsLabel.frame = CGRect(x: 0,
                                             y: 0,
                                             width: userNameCircle.width,
                                             height: userNameCircle.height)
        
        userNameLabel.frame = CGRect(x: userNameCircle.right + 20,
                                     y: 10,
                                     width: contentView.width - 30 - userNameCircle.width - 10,
                                     height: (contentView.height - 20) / 2)
        
        userMessageLabel.frame = CGRect(x: userNameCircle.right + 20,
                                        y: userNameLabel.bottom + 5,
                                        width: contentView.width - 30 - userNameCircle.width - 10,
                                        height: (contentView.height - 20) / 2)
        
    }
    
    public func configure(with model: Conversation) {
        userMessageLabel.text = model.latestMessage.text
        userNameLabel.text = model.name
        
        let initialsArray = model.name.split(separator: " ").map { $0[$0.startIndex] }
        var initials = ""
        let initialsArrayRange = initialsArray.count - 1
        
        for index in 0...initialsArrayRange {
            initials += String(initialsArray[index])
        }
        
        print(initials)
        userNameInitialsLabel.text = initials
        
        /*let path = "images/\(model.otherUserEmail)_profile_picture.png"
        StorageManager.shared.downloadURL(for: path, completion: { [weak self] result in
            switch result {
            case .success(let url):
                
                DispatchQueue.main.async {
                    self?.userImageView.sd_setImage(with: url, completed: nil)
                }
                
            case .failure(let error):
                print("Failed to get image url: \(error)")
            }
        })*/
    }

}

//
//  NewsViewCellLayout.swift
//  Weather
//
//  Created by Andrey Vorobyv on 23.03.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import UIKit
import Kingfisher

class NewsViewCellLayout: UITableViewCell {
    static let reuseId = "NewsViewCellLayout"
    static let offset: CGFloat = 8
    static let avatarHeight: CGFloat = 50
    
    //MARK: - Constants
    private let offset: CGFloat = 8
    private let avatarHeight: CGFloat = 50
    
    //MARK: - Subviews
    private let avatarImageView = UIImageView()
    private let authorLabel = UILabel()
    private let postLabel = UILabel()
    private let attachmentImageView = UIImageView()
    
    //MARK: - Variables
    private var textHeight: CGFloat = 0
    private var attachmentImageHeight: CGFloat = 0
    
    //MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(avatarImageView)
        avatarImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(authorLabel)
        authorLabel.font = UIFont.systemFont(ofSize: 18)
        
        contentView.addSubview(postLabel)
        postLabel.numberOfLines = 0
        
        contentView.addSubview(attachmentImageView)
        attachmentImageView.contentMode = .scaleAspectFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.frame = CGRect(x: offset,
                                       y: offset,
                                       width: avatarHeight,
                                       height: avatarHeight)
        
        authorLabel.frame = CGRect(x: offset + avatarHeight + offset,
                                   y: offset,
                                   width: bounds.width - (offset + avatarHeight + offset),
                                   height: avatarHeight)
        
        postLabel.frame = CGRect(x: offset,
                                 y: offset + avatarHeight,
                                 width: bounds.width - 2*offset,
                                 height: textHeight)
        
        attachmentImageView.frame = CGRect(x: offset,
                                           y: offset + avatarHeight + textHeight,
                                           width: bounds.width - 2*offset,
                                           height: attachmentImageHeight)
    }
    
    //MARK: Configure api
    public func configure(with post: NewsFeedVK, textHeight: CGFloat, imageHeight: CGFloat) {
        //Setting author image and label
        if post.source_Id < 0, let group = post.group {
            self.authorLabel.text = group.group_Name
            avatarImageView.kf.setImage(with: URL(string: group.group_Icon))
        } else if post.source_Id > 0, let user = post.user {
            self.authorLabel.text = "\(user.profiles_FirstName) \(user.profiles_LastName)"
            avatarImageView.kf.setImage(with: URL(string: user.profiles_Icon))
        } else {
            self.authorLabel.text = ""
            avatarImageView.image = UIImage(contentsOfFile: "emptyImage.png")
        }
        
        //Setting post text data
        self.textHeight = textHeight
        guard let data = post.text.data(using: .unicode, allowLossyConversion: true) else { fatalError("Couldn't get text data") }
        let attrStr = try? NSAttributedString(data: data,
                                              options: [.documentType: NSAttributedString.DocumentType.html],
                                              documentAttributes: nil)
        postLabel.attributedText = attrStr
        
        //Setting attachment image
        self.attachmentImageHeight = imageHeight
        attachmentImageView.kf.setImage(with: URL(string: post.photo_Icon))
    }
}

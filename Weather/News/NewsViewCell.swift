//
//  NewsViewCell.swift
//  Weather
//
//  Created by Andrey Vorobyv on 22.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var postIcon: UIImageView!
    @IBOutlet weak var postName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postPhoto: UIImageView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var commentsImage: UIImageView!
    @IBOutlet weak var repostsImage: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var repostsCount: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    









//    @IBOutlet weak var newsLable: UILabel! {
//        didSet {
//        self.newsLable.textColor = UIColor.black
//        }
//    }
//
//    @IBOutlet weak var newsIcon: UIImageView! {
//        didSet {
//            self.newsIcon.layer.borderColor = UIColor.black.cgColor
//            self.newsIcon.layer.borderWidth = 2
//        }
//    }
//
//    @IBOutlet weak var newsLike: UIImageView!
//
//    @IBOutlet weak var newsRead: UIImageView!
//
//    @IBOutlet weak var newsLook: UIImageView!
//
//    func configure(lable: String, icon: UIImage, like:UIImage, read:UIImage, look:UIImage) {
//        self.newsLable.text = lable
//        self.newsIcon.image = icon
//        self.newsLike.image = like
//        self.newsRead.image = read
//        self.newsLook.image = look
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        self.newsLable.text = nil
//        self.newsIcon.image = nil
//        self.newsLike.image = nil
//        self.newsRead.image = nil
//        self.newsLook.image = nil
//    }
}

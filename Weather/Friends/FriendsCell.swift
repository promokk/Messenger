//
//  FriendsCell.swift
//  Weather
//
//  Created by Andrey Vorobyv on 11.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit

class FriendsCell: UICollectionViewCell {
    
    @IBOutlet weak var friend: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var index: Int = 0
    var onLikePressed: ((Int) -> ())?
    
    @IBAction func likePressed(_ sender: Any) {
        onLikePressed?(index)
    }
    
//    public func configure(with friends: Friends) {
//
//        self.friend.text = String(format: "%.0f", friends.firstName, friends.lastName)
//    }

    
//    var constraint: NSLayoutConstraint!
    
//    @IBAction func imageIcon1(_ sender: Any) {
//
//        UIView.animate(withDuration: 1,
//                               delay: 0,
//                               usingSpringWithDamping: 0.5,
//                               initialSpringVelocity: 1,
//                               options: [.autoreverse],
//                               animations: {
//                                self.icon.bounds = CGRect(x: 0, y: 0, width: 45, height: 45)
//
//                })
//    }
    
    
//    @IBAction func buttonLook(_ sender: Any) {
    
//        let animationsGroup = CAAnimationGroup()
//        animationsGroup.duration = 0.5
//        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
//
//        let bounds = CABasicAnimation(keyPath: "bounds")
//        bounds.toValue = icon.bounds = CGRect(x: 0, y: 0, width: self.frame.maxX, height: self.frame.maxY)
//        let frameX = CABasicAnimation(keyPath: "frame.origin.x")
//        frameX.toValue = self.icon.frame.origin.x = frame.midX
//        let frameY = CABasicAnimation(keyPath: "frame.origin.y")
//        frameY.toValue = self.icon.frame.origin.x = frame.midY
//        let position = CABasicAnimation(keyPath: "XPosition")
//        position.toValue = self.icon.center = CGPoint(x: frame.midX , y: frame.midY)
//
//        animationsGroup.animations = [bounds, frameX, frameY, position]
//
//        layer.add(animationsGroup, forKey: nil)
        
//        addSubview(icon)
//        icon.sizeToFit()
//        icon.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        constraint = icon.topAnchor.constraint(equalTo: self.topAnchor)
//        constraint.isActive = true
//
//        self.icon.layoutIfNeeded()
//        UIView.animate(withDuration: 1, animations: {
//            self.constraint.constant = self.frame.midX
//            self.icon.layoutIfNeeded()
//        })
        
        
        
//        UIView.transition(with: icon,
//                          duration: 0.25,
//                          options: .transitionCrossDissolve,
//                          animations: {
//                            self.icon.image = UIImage(named: "smile1")
//                            self.icon.bounds = CGRect(x: 0, y: 0, width: self.frame.maxX, height: self.frame.maxY)
//        })
//
//        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
//            self.icon.frame.origin.x = self.frame.midX
//            self.icon.frame.origin.y = self.frame.midY
//        }, completion: nil)
//    }
}


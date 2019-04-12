//
//  AvatarImage.swift
//  Weather
//
//  Created by Andrey Vorobyv on 14.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit

class AvatarImage: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.width / 2
        layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize.zero
        clipsToBounds = false
    }
}



//
//  LikeButton.swift
//  Weather
//
//  Created by Andrey Vorobyv on 14.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    
    var like = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()

        addGestureRecognizer(tapGestureRecognizer)
    }

    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self,
                                                action: #selector(onTap))
        recognizer.numberOfTapsRequired = 1    // Количество нажатий, необходимое для распознавания
        recognizer.numberOfTouchesRequired = 1 // Количество пальцев, которые должны коснуться экрана для распознавания
        return recognizer
    }()

    @objc func onTap() {
        print("Произошло нажатие")
    }
}


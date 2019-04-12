//
//  loadView.swift
//  Weather
//
//  Created by Andrey Vorobyv on 26.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit

class LoadView: UIView {
        
    let point1 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    let point2 = UIView(frame: CGRect(x: 20, y: 12, width: 20, height: 20))
    let point3 = UIView(frame: CGRect(x: 0, y: 24, width: 20, height: 20))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        point1.layer.backgroundColor = UIColor.red.cgColor
        point1.layer.cornerRadius = bounds.width / 3
        point2.layer.backgroundColor = UIColor.red.cgColor
        point2.layer.cornerRadius = bounds.width / 3
        point3.layer.backgroundColor = UIColor.red.cgColor
        point3.layer.cornerRadius = bounds.width / 3
        
        addSubview(point1)
        addSubview(point2)
        addSubview(point3)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.point1.alpha = 0.2
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.25, options: [.repeat, .autoreverse], animations: {
            self.point2.alpha = 0.2
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.repeat, .autoreverse], animations: {
            self.point3.alpha = 0.2
        }, completion: nil)
    }
}

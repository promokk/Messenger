//
//  ChatViewCell.swift
//  Weather
//
//  Created by Andrey Vorobyv on 12.03.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import UIKit

class ChatViewCell: UITableViewCell {
    
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeMessage: UILabel!
    @IBOutlet weak var textMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

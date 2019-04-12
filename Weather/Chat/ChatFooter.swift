//
//  ChatFooter.swift
//  Weather
//
//  Created by Andrey Vorobyv on 12.03.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import UIKit

class ChatFooter: UITableViewCell {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var chatText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

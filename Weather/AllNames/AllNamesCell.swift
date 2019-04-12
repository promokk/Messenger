//
//  AllNamesCell.swift
//  Weather
//
//  Created by Andrey Vorobyv on 10.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit
import Kingfisher

class AllNamesCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with friends: Friends) {

        self.friendName.text = String(format: "%.0f", friends.first_Name, friends.last_Name)
        self.icon.kf.setImage(with: FriendsService.urlForFriendsIcon(friends.icon_Name))
    }
}

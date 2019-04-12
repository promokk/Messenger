//
//  FrGroupViewCell.swift
//  Weather
//
//  Created by Andrey Vorobyv on 11.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit

class FrGroupViewCell: UITableViewCell {

    @IBOutlet weak var friendGroup: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

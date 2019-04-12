//
//  GroupsNewVK.swift
//  Weather
//
//  Created by Andrey Vorobyv on 02.01.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class GroupsNewVK: Object {
    
    @objc dynamic var user_Id = 0
    @objc dynamic var name_Group = ""
    @objc dynamic var icon_Group = ""
    
    convenience init(json: JSON) {
        self.init()
        
        self.user_Id = json["id"].intValue
        self.name_Group = json["name"].stringValue
        self.icon_Group = json["photo_50"].stringValue
        
    }
}

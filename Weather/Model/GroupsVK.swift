//
//  GroupsVK.swift
//  Weather
//
//  Created by Andrey Vorobyv on 02.01.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class GroupsVK: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    @objc dynamic var user_Id = 0
    @objc dynamic var name_Group = ""
    @objc dynamic var icon_Group = ""
    
    convenience init(json: JSON) {
        self.init()
        
        self.user_Id = json["id"].intValue
        self.name_Group = json["name"].stringValue
        self.icon_Group = json["photo_50"].stringValue
        
    }
    
    override static func primaryKey() -> String? {
        return "user_Id"
    }
}

//{
//    id = 51169426;
//    "is_admin" = 0;
//    "is_advertiser" = 0;
//    "is_closed" = 1;
//    "is_member" = 1;
//    name = "Shell Friends. Clan Group.";
//    "photo_100" = "https://pp.userapi.com/c323726/v323726631/a31f/ayvEcoWxFxg.jpg?ava=1";
//    "photo_200" = "https://pp.userapi.com/c323726/v323726631/a31e/qvOuR9tAS8E.jpg?ava=1";
//    "photo_50" = "https://pp.userapi.com/c323726/v323726631/a320/Z21IT1vMm4A.jpg?ava=1";
//    "screen_name" = cocsf;
//    type = group;
//}

//
//  Friends.swift
//  Weather
//
//  Created by Andrey Vorobyv on 24.12.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Friends: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    @objc dynamic var first_Name = ""
    @objc dynamic var last_Name = ""
    @objc dynamic var icon_Name = ""
    @objc dynamic var name_Id = 0
    
    convenience init(json: JSON) {
        self.init()
        
        self.first_Name = json["first_name"].stringValue
        self.last_Name = json["last_name"].stringValue
        self.icon_Name = json["photo_50"].stringValue
        self.name_Id = json["id"].intValue
    }
    
    override static func primaryKey() -> String? {
        return "name_Id"
    }
}


//{
//    "response": [
//    {
//    "id": 374902487,
//    "first_name": "Aleksey",
//    "last_name": "Dmitrievich",
//    "is_closed": false,
//    "can_access_closed": true,
//    "bdate": "5.11.1996"
//    }
//    ]
//}

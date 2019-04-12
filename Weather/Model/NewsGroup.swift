//
//  NewsGroup.swift
//  Weather
//
//  Created by Andrey Vorobyv on 07.02.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class NewsGroup: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    @objc dynamic var group_Id = 0
    @objc dynamic var group_Name = ""
    @objc dynamic var group_Icon = ""
    
    convenience init(json: JSON) {
        self.init()
        
        self.group_Id = json["id"].intValue
        self.group_Name = json["name"].stringValue
        self.group_Icon = json["photo_50"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "group_Id"
    }
}

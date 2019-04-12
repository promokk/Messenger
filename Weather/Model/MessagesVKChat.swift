//
//  MessagesVKChat.swift
//  Weather
//
//  Created by Andrey Vorobyv on 16.03.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class MessagesVKChat: Object {
    
//    chat
    @objc dynamic var chat_type = ""
    @objc dynamic var title = ""
    @objc dynamic var admin_id = 0
    @objc dynamic var members_count = 0
    @objc dynamic var chat_id = 0
//    users
    @objc dynamic var user_type = ""
    @objc dynamic var user_id = 0
    @objc dynamic var first_name = ""
    @objc dynamic var last_name = ""
    @objc dynamic var online = 0
    @objc dynamic var photo_50 = ""
    
    
    convenience init(json: JSON) {
        self.init()
        
        self.chat_type = json["type"].stringValue
        self.title = json["title"].stringValue
        self.admin_id = json["admin_id"].intValue
        self.members_count = json["members_count"].intValue
        self.chat_id = json["id"].intValue
        
        self.user_type = json["users"]["type"].stringValue
        self.user_id = json["users"]["id"].intValue
        self.first_name = json["users"]["first_name"].stringValue
        self.last_name = json["users"]["last_name"].stringValue
        self.online = json["users"]["online"].intValue
        self.photo_50 = json["users"]["photo_50"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "chat_id"
    }
}

//{
//    "response": {
//        "type": "chat",
//        "title": "Ксения, Андрей",
//        "admin_id": 59657171,
//        "members_count": 3,
//        "id": 11,
//        "users": [{
//        "id": 59657171,
//        "first_name": "Борис",
//        "last_name": "Ботов",
//        "is_closed": true,
//        "can_access_closed": true,
//        "photo_50": "https://vk.com/im...camera_50.png?ava=1",
//        "online": 0,
//        "invited_by": 59657171,
//        "type": "profile"
//        }, {
//        "id": 31993958,
//        "first_name": "Андрей",
//        "last_name": "Воробьев",
//        "is_closed": false,
//        "can_access_closed": true,
//        "photo_50": "https://pp.userap...ITtEEbPNI.jpg?ava=1",
//        "online": 1,
//        "invited_by": 59657171,
//        "type": "profile"
//        }, {
//        "id": 8028001,
//        "first_name": "Ксения",
//        "last_name": "Фролова",
//        "is_closed": false,
//        "can_access_closed": true,
//        "photo_50": "https://vk.com/im...camera_50.png?ava=1",
//        "online": 0,
//        "invited_by": 59657171,
//        "type": "profile"
//        }]
//    }
//}

//
//  MessagesVK.swift
//  Weather
//
//  Created by Andrey Vorobyv on 13.03.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class MessagesVKConversation: Object {
    
//    conversation, peer
    @objc dynamic var conversation_peer_Id = 0
    @objc dynamic var conversation_type = ""
    @objc dynamic var conversation_peer_localId = 0
//    messages
    @objc dynamic var conversation_inRead = 0
    @objc dynamic var conversation_outRead = 0
    @objc dynamic var conversation_lastMessagesId = 0
    @objc dynamic var conversation_unreadCount = 0
//    last_message
    @objc dynamic var lastMessages_id = 0
    @objc dynamic var lastMessages_date = 0
    @objc dynamic var lastMessages_fromId = 0
    @objc dynamic var lastMessages_peerId = 0
    @objc dynamic var lastMessages_text = ""
    
    
    
    convenience init(json: JSON) {
        self.init()
        
        self.conversation_peer_Id = json["conversation"]["peer"]["id"].intValue
        self.conversation_type = json["conversation"]["peer"]["type"].stringValue
        self.conversation_peer_localId = json["conversation"]["peer"]["local_id"].intValue
        
        self.conversation_inRead = json["conversation"]["in_read"].intValue
        self.conversation_outRead = json["conversation"]["out_read"].intValue
        self.conversation_lastMessagesId = json["conversation"]["last_message_id"].intValue
        self.conversation_unreadCount = json["conversation"]["unread_count"].intValue
        
        self.lastMessages_id = json["last_message"]["id"].intValue
        self.lastMessages_date = json["last_message"]["date"].intValue
        self.lastMessages_fromId = json["last_message"]["from_id"].intValue
        self.lastMessages_peerId = json["last_message"]["peer_id"].intValue
        self.lastMessages_text = json["last_message"]["text"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "conversation_peer_Id"
    }
}

//{
//    "response": {
//        "count": 241,
//        "items": [{
//        "conversation": {
//        "peer": {
//        "id": 195298059,
//        "type": "user",
//        "local_id": 195298059
//        },
//        "in_read": 688614,
//        "out_read": 688872,
//        "last_message_id": 688872,
//        "unread_count": 1,
//        "can_write": {
//        "allowed": true
//        }
//        },
//        "last_message": {
//        "date": 1552492929,
//        "from_id": 195298059,
//        "id": 688872,
//        "out": 0,
//        "peer_id": 195298059,
//        "text": "Через минут 30 играем?)",
//        "conversation_message_id": 6689,
//        "fwd_messages": [],
//        "important": false,
//        "random_id": 0,
//        "attachments": [],
//        "is_hidden": false
//        }
//        }],
//        "unread_count": 1,
//        "profiles": [{
//        "id": 195298059,
//        "first_name": "Паша",
//        "last_name": "Александров",
//        "is_closed": false,
//        "can_access_closed": true,
//        "sex": 2,
//        "screen_name": "id195298059",
//        "photo_50": "https://sun1-8.us...vMWi91nMo.jpg?ava=1",
//        "photo_100": "https://sun1-2.us...Jk9mTcmV4.jpg?ava=1",
//        "online": 0
//        }]
//    }
//}

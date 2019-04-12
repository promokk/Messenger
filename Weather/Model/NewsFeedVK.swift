//
//  NewsFeedVK.swift
//  Weather
//
//  Created by Andrey Vorobyv on 04.02.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class NewsFeedVK: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    
    @objc dynamic var type = ""
    @objc dynamic var date = 0
    @objc dynamic var source_Id = 0
    @objc dynamic var post_Id = 0
    @objc dynamic var text = ""
    
    @objc dynamic var commentsCount = 0
    
    @objc dynamic var likesCount = 0
    
    @objc dynamic var repostsCount = 0
    
    @objc dynamic var photo_Id = 0
    @objc dynamic var photo_Icon = ""
    @objc dynamic var access_key = 0
    
    @objc dynamic var user: NewsProfile?
    @objc dynamic var group: NewsGroup?

    convenience init(json: JSON) {
        self.init()
        
        self.type = json["type"].stringValue
        self.date = json["date"].intValue
        self.source_Id = json["source_id"].intValue
        self.post_Id = json["post_id"].intValue
        self.text = json["text"].stringValue
        self.commentsCount = json["comments"]["count"].intValue
        self.likesCount = json["likes"]["count"].intValue
        self.repostsCount = json["reposts"]["count"].intValue
        self.photo_Id = json["attachments"][0]["photo"]["id"].intValue
        self.access_key = json["attachments"][0]["photo"]["access_key"].intValue
        self.photo_Icon = json["attachments"][0]["photo"]["sizes"][3]["url"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "source_Id"
    }
    
    var url: String {
        return photo_Icon
    }
}


//{
//    "response": {
//        "items": [{
//        "type": "post",
//        "source_id": -105256967,
//        "date": 1549295490,
//        "post_id": 1253649,
//        "post_type": "post",
//        "text": "Друзья!
//
//        Завтра в 10:00 (мск) в игре начнутся профилактические работы.
//        Ориентировочное время окончания 14:00 (мск).
//
//        Так как Мастер Усов ушел покорять снежные горные вершины, стрима завтра не будет &#10052;",
//        "marked_as_ads": 0,
//        "attachments": [{
//        "type": "photo",
//        "photo": {
//        "id": 456367108,
//        "album_id": -7,
//        "owner_id": -105256967,
//        "user_id": 100,
//        "sizes": [{
//        "type": "m",
//        "url": "https://sun1-2.us...e58/y6ClwIBPG_Q.jpg",
//        "width": 130,
//        "height": 69
//        }, {
//        "type": "o",
//        "url": "https://sun1-12.u...e5d/YwTnwd97z2o.jpg",
//        "width": 130,
//        "height": 87
//        }, {
//        "type": "p",
//        "url": "https://sun1-15.u...e5e/oaUdj86D_qs.jpg",
//        "width": 200,
//        "height": 133
//        }, {
//        "type": "q",
//        "url": "https://sun1-8.us...e5f/txF7AgdWM8Q.jpg",
//        "width": 320,
//        "height": 213
//        }, {
//        "type": "r",
//        "url": "https://sun1-3.us...e60/JEZBE5LZUKY.jpg",
//        "width": 510,
//        "height": 340
//        }, {
//        "type": "s",
//        "url": "https://sun1-20.u...e57/Eio7n2l5bns.jpg",
//        "width": 75,
//        "height": 40
//        }, {
//        "type": "w",
//        "url": "https://sun1-10.u...e5c/Uq3bh8uQYeE.jpg",
//        "width": 1358,
//        "height": 717
//        }, {
//        "type": "x",
//        "url": "https://sun1-6.us...e59/rsUqFQPNTDc.jpg",
//        "width": 604,
//        "height": 319
//        }, {
//        "type": "y",
//        "url": "https://sun1-17.u...e5a/54z5uZBiuig.jpg",
//        "width": 807,
//        "height": 426
//        }, {
//        "type": "z",
//        "url": "https://sun1-8.us...e5b/kH557ij1r4U.jpg",
//        "width": 1280,
//        "height": 676
//        }],
//        "text": "",
//        "date": 1549295397,
//        "post_id": 1253649,
//        "access_key": "63707de8ed3848ffb4"
//        }
//        }],
//        "post_source": {
//        "type": "vk"
//        },
//        "comments": {
//        "count": 0,
//        "can_post": 1,
//        "groups_can_post": true
//        },
//        "likes": {
//        "count": 0,
//        "user_likes": 0,
//        "can_like": 1,
//        "can_publish": 1
//        },
//        "reposts": {
//        "count": 0,
//        "user_reposted": 0
//        },
//        "is_favorite": false
//        }
//        "groups": [{
//        "id": 106879986,
//        "name": "Новости Mail.Ru",
//        "screen_name": "novostinamaile",
//        "is_closed": 0,
//        "type": "page",
//        "is_admin": 0,
//        "is_member": 1,
//        "photo_50": "https://pp.userap...812/NbjOdA_39Yg.jpg",
//        "photo_100": "https://pp.userap...811/OkaRljXMF4E.jpg",
//        "photo_200": "https://pp.userap...80f/zHl0wK0LwGA.jpg"
//        }

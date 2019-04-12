//
//  PhotosVK.swift
//  Weather
//
//  Created by Andrey Vorobyv on 03.01.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class PhotosVK: Object {
//    var description: String {
//        return String("\(user_Id) \(name_Id) \(icon_Name)")
//    } CustomStringConvertible - тип класса для вывода информации в консоль.

    @objc dynamic var id : Int = 0
    @objc dynamic var album_id : Int = 0
    
    @objc dynamic var type : String = ""
    @objc dynamic var url : String = ""
    @objc dynamic var likes : Int = 0
    @objc dynamic var userLike : Int = 0
    
    convenience init(json: JSON) {
        self.init()
        
        self.id = json["id"].intValue
        self.album_id = json["album_id"].intValue
        self.type = json["sizes"][3]["type"].stringValue
        self.url = json["sizes"][3]["url"].stringValue
        self.likes = json["likes"]["count"].intValue
        self.userLike = json["likes"]["user_likes"].intValue
    }
}
    
//    @objc dynamic var icon_Name = ""
//    @objc dynamic var name_Id = 0
//    @objc dynamic var user_Id = 0
//
//    convenience init(json: JSON) {
//        self.init()
//
//        self.icon_Name = json["photo_75"].stringValue
//        self.name_Id = json["id"].intValue
//        self.user_Id = json["owner_id"].intValue
//    }
//}

//{
//    "album_id" = "-6";
//    date = 1305893561;
//    id = 263189937;
//    "owner_id" = 31993958;
//    "photo_130" = "https://pp.userapi.com/c10867/u31993958/-6/m_2d92ebbe.jpg";
//    "photo_604" = "https://pp.userapi.com/c10867/u31993958/-6/x_2bc692ad.jpg";
//    "photo_75" = "https://pp.userapi.com/c10867/u31993958/-6/s_0deba68b.jpg";
//    "post_id" = 83;
//    text = "";
//}

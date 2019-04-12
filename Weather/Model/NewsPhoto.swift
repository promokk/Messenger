//
//  NewsPhoto.swift
//  Weather
//
//  Created by Andrey Vorobyv on 07.02.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class NewsPhoto: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    
//    @objc dynamic var title = ""
    
    @objc dynamic var photo_Id = 0
    @objc dynamic var photo_Icon = ""
    @objc dynamic var access_key = 0
    
    convenience init(json: JSON) {
        self.init()
        
        //        title - вроде как заголовок.
//        self.title = json["attachments"]["link"]["title"].stringValue
        self.photo_Id = json["attachments"][0]["photo"]["id"].intValue
        self.access_key = json["attachments"][0]["photo"]["access_key"].intValue
        self.photo_Icon = json["attachments"][0]["photo"]["sizes"][3]["url"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "photo_Id"
    }
}

//attachments =                         (
//    {
//        type = video;
//        video =                                 {
//            "access_key" = 419b9c468f450e508b;
//            "can_add" = 1;
//            comments = 22;
//            date = 1549552240;
//            description =

//attachments =                 (
//    {
//        photo =                         {
//            "access_key" = 5dceb8cb895a11ace0;
//            "album_id" = "-7";
//            date = 1549547968;
//            id = 456316036;
//            "owner_id" = "-41";
//            "post_id" = 5295230;
//            sizes =                             (

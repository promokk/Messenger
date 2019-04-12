//
//  FriendsRealm.swift
//  Weather
//
//  Created by Andrey Vorobyv on 21.01.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import RealmSwift

class FriendsRealm: Object {
    @objc dynamic var name = ""
    var friends = List<Friends>()
    
    convenience init(name: String, friends: [Friends] = []) {
        self.init()
        
        self.name = name
        self.friends.append(objectsIn: friends)
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }
}

//
//  Session.swift
//  Weather
//
//  Created by Andrey Vorobyv on 17.12.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit

class Session {
    private init() { }
    
    public static let instance = Session()
    
    var token: String = ""
    var userld: Int = 0
}

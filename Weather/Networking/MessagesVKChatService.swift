//
//  MessagesVKChatService.swift
//  Weather
//
//  Created by Andrey Vorobyv on 16.03.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class MessagesVKChatService {
    
    private let baseUrl = "https://api.vk.com"
    private let path = "/method/messages.getChat"
    
    public func loadListChat(completionHandler: (([MessagesVKChat]?, Error? ) -> Void)? = nil) {
        
        let params: Parameters = [
            "access_token": Session.instance.token,
            "fields": "photo_50, online",
            "name_case": "nom",
            "v": "5.92"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON {
            (response) in
            switch response.result {
            case .failure(let error):
                completionHandler?(nil, error)
            case .success(let value):
                let json = JSON(value)
                
                let chat = json["response"].arrayValue.map { MessagesVKChat(value: $0) }
                completionHandler?(chat, nil)
                
                print(chat)
            }
        }
    }
}

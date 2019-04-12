//
//  MessagesVKService.swift
//  Weather
//
//  Created by Andrey Vorobyv on 13.03.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class MessagesVKConversationService {
    
    private let baseUrl = "https://api.vk.com"
    private let path = "/method/messages.getConversations"
    
    public func loadListConversation(completionHandler: (([MessagesVKConversation]?, Error? ) -> Void)? = nil) {
        
        let params: Parameters = [
            "access_token": Session.instance.token,
            "offset": "0",
            "count": "20",
            "extended": "1",
            "v": "5.92"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON {
            (response) in
            switch response.result {
            case .failure(let error):
                completionHandler?(nil, error)
            case .success(let value):
                let json = JSON(value)
                
                let conversation = json["response"]["items"].arrayValue.map { MessagesVKConversation(json: $0) }
                completionHandler?(conversation, nil)
                
                print(conversation)
            }
        }
    }
}

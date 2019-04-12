//
//  FriendsService.swift
//  Weather
//
//  Created by Andrey Vorobyv on 24.12.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift

class FriendsService {
    
    private let baseUrl = "https://api.vk.com"
    private let path = "/method/friends.get"
    
    public func loadListFriends(completionHandler: (([Friends]?, Error? ) -> Void)? = nil) {
        
        let params: Parameters = [
            "access_token": Session.instance.token,
            "order": "name",
            "fields": "nickname, photo_50",
            "v": "5.8"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON(queue: .global(qos: .userInitiated)) {
            (response) in
            switch response.result {
            case .failure(let error):
                completionHandler?(nil, error)
            case .success(let value):
                let json = JSON(value)
                
                let friends = json["response"]["items"].arrayValue.map { Friends(json: $0) }
                DispatchQueue.main.async {
                    completionHandler?(friends, nil)
                }
                print(friends)
            }
        }
        
        
//        Alamofire.request(url, method: .get, parameters: parameters).responseData { [weak self] repsons in
//            guard let data = repsons.value else { return }
//
//            let weather = try! JSONDecoder().decode(WeatherResponse.self, from: data).list
//
//            self?.saveWeatherData(weathers)
//
//            completion(weathers)
//        }

    }
    
    // сохронение данных в Realm
//    func saveFriendDate(_ friends: [Friends]) {
//
//        do {
//            let realm = try Realm()
//            realm.beginWrite()
//            realm.add(friends)
//            try realm.commitWrite()
//        } catch {
//            print(error)
//        }
//    }
    
    static func urlForFriendsIcon(_ icon: String) -> URL? {
        return URL(string: "https://api.vk.com/img/w/\(icon).png")
    }
}


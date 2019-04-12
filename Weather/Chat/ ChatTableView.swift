//
//   ChatTableView.swift
//  Weather
//
//  Created by Andrey Vorobyv on 12.03.2019.
//  Copyright © 2019 Andrey Vorobyv. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class ChatTableView: UITableViewController {
    
    var messagesVK = [MessagesVKConversation]()
    let messagesVKConversationService = MessagesVKConversationService()
    let messagesVKchatService = MessagesVKChatService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesVKConversationService.loadListConversation() { [weak self] messages, error in
            guard let self = self, error == nil,
                let messages = messages else { print(error?.localizedDescription as Any); return }
            
            self.messagesVK = messages
            self.tableView.reloadData()
        }
    }
    
    private var dateFormatter: DateFormatter {
        let dt = DateFormatter()
        dt.dateFormat = "EEEE, HH:mm"
        return dt
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesVK.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatViewCell", for: indexPath) as! ChatViewCell
//        let messages = messagesVK[indexPath.row]
//        let dateNews = Date(timeIntervalSince1970: TimeInterval(messages.messages_Date))
        
//        guard let realm = try? Realm() else { return UITableViewCell() }
        
//        let messagesProfile = realm.object(ofType: Friends.self, forPrimaryKey: messages.messages_Id)
        
//        cell.postDate.text = dateFormatter.string(from: dateNews)
//        cell.postText.text = newsF.text
//        cell.postPhoto.image = photoService?.photo(atIndexpath: indexPath, byUrl: newsF.url)
//        cell.likeCount.text = String(newsF.likesCount)
//        cell.commentsCount.text = String(newsF.commentsCount)
//        cell.repostsCount.text = String(newsF.repostsCount)
        
        return cell
    }
}

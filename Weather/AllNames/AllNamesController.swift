//
//  AllNamesController.swift
//  Weather
//
//  Created by Andrey Vorobyv on 10.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift
import Firebase

class AllNamesController: UITableViewController {
    
    @IBAction func backButton(_ sender: Any) {
        
        VKLoginViewController().deleteCookies()
        
        let viewController:
            UIViewController = UIStoryboard(
                name: "Main", bundle: nil
                ).instantiateViewController(withIdentifier: "start229") as UIViewController
        self.present(viewController, animated: true, completion: nil)
        
        try? Auth.auth().signOut()
    }
//    let header = Header()
//    var sectionTitles = ["A", "B"]
//
//    var Names = [["Andrey", "Alex", "Artem", "Anton","Avram"],["Boris", "Bebe", "Bobo", "Bubu","Bibi"]]
//    var Icon = [UIImage(named: "smile1"), UIImage(named: "smile2"), UIImage(named: "smile3"), UIImage(named: "smile4"), UIImage(named: "smile5")]
    
    var friends: Results<Friends>? = DatabaseService.get(Friends.self)
    var notificationToken: NotificationToken?
    let friendsService = FriendsService()
    
    var friendSectionsVK = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(AllNamesCellLayout.self,
//                           forCellReuseIdentifier: AllNamesCellLayout.reuseId)
        
        configureView()
        
//        let headerNib = UINib.init(nibName: "Header", bundle: Bundle.main)
//        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "Header")
        
            friendsService.loadListFriends() { [weak self] friends, error in
            guard let self = self, error == nil,
                let friends = friends else { print(error?.localizedDescription as Any); return }
            
//            self.friends = friends
            
            let realm = try? Realm()
            try? realm?.write {
                if self.friends != nil {
                    realm?.delete(self.friends!)
                }
            }
            
            try? DatabaseService.save(friends, update: true)
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notificationToken = friends?.observe { [weak self] changes in
            guard let self = self else { return }
            switch changes {
            case .initial(_):
                self.tableView.reloadData()
            case .update(_, let dels, let ins, let mods):
                self.tableView.applyChanges(deletions: dels, insertions: ins, updates: mods)
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        definesPresentationContext = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends?.count ?? 0
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! Header
//        headerView.headerLable.text = sectionTitles[section]
//        return headerView
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку имз пула
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as? AllNamesCell,
            let friend = friends?[indexPath.row] else { return UITableViewCell() }
        // Получаем имя для конкретной строки
//        let friend = friends?[indexPath.row]
        // Устанавливаем имя в надпись ячейки
        cell.friendName.text = "\(friend.first_Name) \(friend.last_Name)"
        cell.icon.kf.setImage(with: URL(string: friend.icon_Name))

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllNamesCellLayout.reuseId, for: indexPath) as? AllNamesCellLayout,
//            let friend = friends?[indexPath.row] else { fatalError() }
//        
//        let iconUrl = URL(string: friend.icon_Name)
//        let nameText = "\(friend.first_Name) \(friend.last_Name)"
//        
//        cell.configure(with: iconUrl, nameText: nameText)
//        
//        return cell
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adddName" {
            let friendsController = segue.source as! AllNamesController
            let destenationVC = segue.destination as! FriendsViewController
            if let indexPath = friendsController.tableView.indexPathForSelectedRow {
                let friendID = friends?[indexPath.row].name_Id
                let firstName = friends?[indexPath.row].first_Name
                let lastName = friends?[indexPath.row].last_Name
                if let friendID = friendID,
                    let firstName = firstName,
                    let lastName = lastName {
                    destenationVC.name2 = String(friendID)
                    destenationVC.userID = String(friendID)
                    print(friendID)
                    destenationVC.screenName = firstName + " " + lastName
                }
            }
        }
    }
}

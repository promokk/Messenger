//
//  FrGroupViewController.swift
//  Weather
//
//  Created by Andrey Vorobyv on 11.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit
import Kingfisher

class FrGroupViewController: UIViewController {
    
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
//    let FriendGroup = ["Family","Best Friend","Ignore"]
//    var FriendGroupNew: [String] = [String]()
//    var Icon = [UIImage(named: "group1"), UIImage(named: "group2"), UIImage(named: "group3")]
//    var IconNew: [UIImage] = [UIImage]()
    
    var groupsNew = [GroupsNewVK]()
    let groupsNewService = GroupsNewVKService()
    var groupsNewSearch: [Any] = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        groupsNewSearch = groupsNew
        
//        groupsNewService.loadListGroupsNew() { [weak self] groupsNew, error in
//            guard let self = self, error == nil,
//                let groupsNew = groupsNew else { print(error?.localizedDescription as Any); return }
//
//            self.groupsNew = groupsNew
//            self.tableView.reloadData()
//        }
    }
    
    private func configureView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        definesPresentationContext = true
    }
}
    
    // MARK: - Table view data source
    
extension FrGroupViewController: UITableViewDelegate, UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupsNew.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsGroup", for: indexPath) as! FrGroupViewCell
        let groupNew = groupsNew[indexPath.row]
        
        cell.friendGroup.text = groupNew.name_Group
        cell.icon.kf.setImage(with: URL(string: groupNew.icon_Group))

        return cell
        }
    }
    
extension FrGroupViewController: UISearchBarDelegate {

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            groupsNewService.loadListGroupsNew(searchText: searchText) { [weak self] groupsNew, error in
                guard let self = self, error == nil,
                    let groupsNew = groupsNew else { print(error?.localizedDescription as Any); return }
                
                self.groupsNew = groupsNew
                self.tableView.reloadData()
            }
        }
    }



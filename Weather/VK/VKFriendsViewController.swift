//
//  VKFriendsViewController.swift
//  Weather
//
//  Created by Andrey Vorobyv on 25.12.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit

class VKFriendsViewController: UICollectionViewController {
    
    private let friendsService = FriendsService()
    public var nameId = 374902487
    private var friends = [Friends]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = String(nameId)
        
        friendsService.friendsForecast(for: nameId) { [weak self] friends, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let friends = friends, let self = self else { return }
            
            self.friends = friends
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return friends.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendsCell
        
        cell.configure(with: friends[indexPath.row])
        
        return cell
    }
}

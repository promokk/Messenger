//
//  FriendsViewContriller.swift
//  Weather
//
//  Created by Andrey Vorobyv on 11.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class FriendsViewController: UICollectionViewController{
    
    @IBAction func scrollImage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "PictureController", sender: self)
    }
    
    let userVKPhotosService = PhotosVKService()
    var photos = [PhotosVK]()
    var name2 = ""
    
    var userID = ""
    var screenName = ""
    var photoIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userVKPhotosService.loadListPhotosVK(for: userID) {  [weak self]  (photos, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let photos = photos, let self = self else { return }
            
            self.photos = photos
            
            self.title = self.screenName
            
            self.collectionView.reloadData()
        }
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCell", for: indexPath) as! FriendsCell
        
        cell.icon.kf.setImage(with: PhotosVKService.urlForUserVKPhoto(photos[indexPath.row].url))
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = photos[indexPath.item]
        photoIndex = indexPath.item
        performSegue(withIdentifier: "imageScroll", sender: image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotoPageView" {
            let destinationVC = segue.destination as! PictureController
            destinationVC.image = (sender as? String)
            destinationVC.photos = self.photos
            destinationVC.photoIndex = self.photoIndex
            destinationVC.userID = self.userID
            let photoId = photos[photoIndex].id
            destinationVC.photoID = String(photoId)
            // Добавляем строчку с проверкой нужного идентификатора, чтобы передать массив photos
        } else if segue.identifier == "imageScroll" {
            guard let destinationVC = segue.destination as? PictureController else { return }
            destinationVC.photos = photos
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}
        
//        UIView.transition(with: cell.likeCount,
//                          duration: 0.25,
//                          options: .transitionFlipFromRight,
//                          animations: {
//                            cell.likeCount.text = "\(self.likes[indexPath.row])"
//        })
//
//        cell.onLikePressed = { [weak self] index in
//            guard let oldLike = self?.likes[index] else { return }
//            self?.likes[index] = (oldLike == 1) ? 0 : 1
//            self?.collectionView.reloadData()
//        }
//
//        let like = likes[indexPath.row]
//
//        if like == 1 {
//            cell.likeCount.textColor = UIColor.green
//            cell.likeButton.backgroundColor = UIColor.green
//        } else {
//            cell.likeCount.textColor = UIColor.black
//            cell.likeButton.backgroundColor = UIColor.white
//        }
        
        
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Show Pictures",
//            let destinationVC = segue.destination as? PictureController {
//            destinationVC.photos = photos
//        }
//
//        if let indexPath = collectionView.indexPathsForSelectedItems?.first {
//            let photo = photos[indexPath.row]
//        }

    
    //    @IBAction func addName(segue: UIStoryboardSegue) {
//
//        // Проверяем иденфикацию перехода, чтобы убедиться, что это нужный элемент
//        if segue.identifier == "addName" {
//            // Получаем ссылку контроллера, с которого осуществлен переход
//            let allNamesController = segue.source as! AllNamesController
//            // Получаем игндекс выделленой ячейки
//            if let indexPath = allNamesController.tableView.indexPathForSelectedRow {
//                // Получаем имя по индексу
//                let name = allNamesController.Names[indexPath.row]
//                let icon = allNamesController.Icon[indexPath.row]
//                // Проверяем, что такого имени нет в списке
//                if !Names.contains(name) || !Icon.contains(icon!) {
//                    // Добовляем имя в список выбранных
//                    Names.append(name)
//                    Icon.append(icon!)
//                    // Обновляем таблицу
//                    collectionView.reloadData()
//                }
//            }
//        }
//    }


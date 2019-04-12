//
//  MyNamesController.swift
//  Weather
//
//  Created by Andrey Vorobyv on 10.11.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class MyNamesController: UITableViewController {
    
//    var Names = ["Gifts", "Business", "Shopping on site"]
//    var Icon = [UIImage(named: "group4"), UIImage(named: "group5"), UIImage(named: "group6")]
    
    var groups: Results<GroupsVK>? = DatabaseService.get(GroupsVK.self)
    var notificationToken: NotificationToken?
    let groupsService = GroupsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()

        groupsService.loadListGroups() { [weak self] groups, error in
            guard let self = self, error == nil,
                let groups = groups else { print(error?.localizedDescription as Any); return }
            
            let realm = try? Realm()
            try? realm?.write {
                if self.groups != nil {
                    realm?.delete(self.groups!)
                }
            }
            
            try? DatabaseService.save(groups, update: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notificationToken = groups?.observe { [weak self] changes in
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

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyNameCell", for: indexPath) as? MyNamesCell, let group = groups?[indexPath.row] else { return UITableViewCell() }
        cell.friendName.text = group.name_Group
        cell.icon.kf.setImage(with: URL(string: group.icon_Group))

        return cell
    }
    
//    @IBAction func adddName(segue: UIStoryboardSegue) {
//
//        // Проверяем иденфикацию перехода, чтобы убедиться, что это нужный элемент
//        if segue.identifier == "adddName" {
//            // Получаем ссылку контроллера, с которого осуществлен переход
//            let frGroupViewController = segue.source as! FrGroupViewController
//            // Получаем игндекс выделленой ячейки
//            if let indexPath = frGroupViewController.tableView.indexPathForSelectedRow {
//                // Получаем имя по индексу
//                let name = frGroupViewController.FriendGroupNew[indexPath.row]
//                let icon = frGroupViewController.Icon[indexPath.row]
//                // Проверяем, что такого имени нет в списке
//                if !Names.contains(name) || !Icon.contains(icon!) {
//                    // Добовляем имя в список выбранных
//                    Names.append(name)
//                    Icon.append(icon!)
//                    // Обновляем таблицу
//                    tableView.reloadData()
//                }
//            }
//        }
//    }

//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        // Если была нажата кнопка "удалить":
//        if editingStyle == .delete {
//            // Удаляем имя из масива
//            Names.remove(at: indexPath.row)
//            Icon.remove(at: indexPath.row)
//            // И удаляем строку из таблицы
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
}

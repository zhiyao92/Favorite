//
//  MainTableTableViewController.swift
//  Favorite
//
//  Created by Kelvin Tan on 11/25/18.
//  Copyright © 2018 Kelvin Tan. All rights reserved.
//

import UIKit

class MainTableTableViewController: UITableViewController, FavoriteDelegate {
    func add(String: String) {
        self.favoriteList.append(String)
    }
    
    func remove(Int: Int) {
        self.favoriteList.remove(at: Int)
    }
    
    var delegate: FavoriteDelegate?
    var lists = ["Malaysia","Singapore","Thailand","Vietnam",]
    var favoriteList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = lists[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        var object = cell?.textLabel?.text ?? ""
        self.add(String: object)
        self.favoriteList = Array(Set(self.favoriteList))
        
        let alert = UIAlertController(title: "Added into Favorite List", message: "\(object) is added into favorite list", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFavorite" {
            guard let view = segue.destination as? FavoriteTableViewController else { return }
            view.delegate = self
            view.favoriteList = Array(Set(favoriteList))
        }
    }
}

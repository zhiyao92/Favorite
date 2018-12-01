//
//  FavoriteTableViewController.swift
//  Favorite
//
//  Created by Kelvin Tan on 11/25/18.
//  Copyright © 2018 Kelvin Tan. All rights reserved.
//

import UIKit

protocol FavoriteDelegate {
    func add(String: String)
    func remove(Int: Int)
}

class FavoriteTableViewController: UITableViewController {

    var delegate: FavoriteDelegate?
    var favoriteList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = favoriteList[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.remove(Int: indexPath.row)
        self.favoriteList.remove(at: indexPath.row)
        
        let alert = UIAlertController(title: "Removed from Favorite List", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
        tableView.reloadData()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

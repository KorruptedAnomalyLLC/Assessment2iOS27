//
//  ItemListTableViewController.swift
//  Assessment2iOS27
//
//  Created by Austin West on 6/21/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class ItemListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ItemController.shared.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        guard let item = ItemController.shared.fetchedResultsController.fetchedObjects?[indexPath.row] else { return UITableViewCell() }
        
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let item = ItemController.shared.fetchedResultsController.fetchedObjects?[indexPath.row] else { return }
            ItemController.shared.remove(item: item)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}



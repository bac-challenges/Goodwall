//
//  DetailViewController.swift
//  GoodwallChallenge
//
//  Created by emile on 17/03/2022.
//

import UIKit

final class DetailViewController: UITableViewController, DetailViewModelInjected {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailViewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        let item = detailViewModel.items[indexPath.row]
        
        cell.textLabel?.text = item
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    }

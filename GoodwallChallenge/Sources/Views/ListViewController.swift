//
//  ListController.swift
//  GoodwallChallenge
//
//  Created by emile on 15/03/2021.
//

import UIKit
import RxSwift
import RxCocoa

final class ListViewController: UITableViewController {
    
    var items: [Post] = []
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Posts"
        tableView.register(ListViewCell.self, forCellReuseIdentifier: "CELL")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getItems()
    }
}

// MARK: - UITableViewDataSource
extension ListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.author?.displayName
        cell.textLabel?.numberOfLines = 0
        
        cell.detailTextLabel?.text = item.author?.location?.formattedAddress
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetail(items[indexPath.row])
    }
}

// MARK: - ListCoordinatorInjected
extension ListViewController: ListCoordinatorInjected {
    func showDetail(_ item: Post) {
        listCoordinator.showDetail(item)
    }
}

// MARK: - ListViewModelInjected
extension ListViewController: ListViewModelInjected {
    private func getItems() {
        listViewModel.getItems().subscribe(
            onNext: { [self] items in
                self.items = items
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            },
            onError: { error in
                print(error.localizedDescription)
            },
            onCompleted: {
                print("Completed event.")
            }).disposed(by: disposeBag)
    }
}

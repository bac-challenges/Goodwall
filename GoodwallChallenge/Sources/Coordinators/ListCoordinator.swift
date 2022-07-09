//
//  ListCoordinator.swift
//  GoodwallChallenge
//
//  Created by emile on 15/03/2021.
//

import UIKit

final class ListCoordinator: Coordinator, WindowInjected, NavigationControllerInjected, DetailCoordinatorInjected, DetailViewModelInjected {

    func start() -> UIViewController {
        ListViewController()
    }
    
    func showDetail(_ item: Post) {
        detailViewModel.item = item
        let vc = detailCoordinator.start()
        self.navigation.pushViewController(vc, animated: true)
    }
}

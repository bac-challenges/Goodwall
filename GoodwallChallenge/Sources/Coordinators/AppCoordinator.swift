//
//  AppCoordinator.swift
//  GoodwallChallenge
//
//  Created by emile on 15/03/2021.
//

import UIKit

final class AppCoordinator: Coordinator, WindowInjected, NavigationControllerInjected, ListCoordinatorInjected {
    func start() -> UIViewController {
        navigation.viewControllers = [listCoordinator.start()]
        return navigation
    }
}

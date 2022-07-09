//
//  DIContainer.swift
//  GoodwallChallenge
//
//  Created by emile on 15/03/2021.
//

import UIKit

// MARK: - Coordinator
struct InjectionMap {
    static var appCoordinator = AppCoordinator()
    static var listCoordinator = ListCoordinator()
    static var detailCoordinator = DetailCoordinator()
}

// MARK: AppCoordinator
protocol AppCoordinatorInjected {}
extension AppCoordinatorInjected {
    var appCoordinator: AppCoordinator { get { return InjectionMap.appCoordinator } }
}

// MARK: ListCoordinator
protocol ListCoordinatorInjected {}
extension ListCoordinatorInjected {
    var listCoordinator: ListCoordinator { get { return InjectionMap.listCoordinator } }
}

// MARK: DetailCoordinator
protocol DetailCoordinatorInjected {}
extension DetailCoordinatorInjected {
    var detailCoordinator: DetailCoordinator { get { return InjectionMap.detailCoordinator } }
}


// MARK: - View Model
extension InjectionMap {
    static var listViewModel = ListViewModel()
    static var detailViewModel = DetailViewModel()
}

// MARK: ListViewModel
protocol ListViewModelInjected {}
extension ListViewModelInjected {
    var listViewModel: ListViewModel { get { return InjectionMap.listViewModel } }
}

// MARK: DetailViewModel
protocol DetailViewModelInjected {}
extension DetailViewModelInjected {
    var detailViewModel: DetailViewModel { get { return InjectionMap.detailViewModel } }
}


// MARK: - Util
extension InjectionMap {
    static var window = UIWindow()
    static var navigation = UINavigationController()
    static var urlSession = URLSession(configuration: URLSessionConfiguration.default)
    static var service = Service()
    static var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

// MARK: UIWindow
protocol WindowInjected {}
extension WindowInjected {
    var window: UIWindow { get { return InjectionMap.window } }
}

// MARK: UINavigationController
protocol NavigationControllerInjected {}
extension NavigationControllerInjected {
    var navigation: UINavigationController { get { return InjectionMap.navigation } }
}

// MARK: Service
protocol ServiceInjected {}
extension ServiceInjected {
    var service: Service { get { return InjectionMap.service } }
}

// MARK: URLSession
protocol URLSessionInjected {}
extension URLSessionInjected {
    var urlSession: URLSession { get { return InjectionMap.urlSession } }
}

// MARK: JSONDecoder
protocol JSONDecoderInjected {}
extension JSONDecoderInjected {
    var jsonDecoder: JSONDecoder { get { return InjectionMap.jsonDecoder } }
}

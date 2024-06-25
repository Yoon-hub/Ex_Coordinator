//
//  Coordinator.swift
//  Ex_Coordinator
//
//  Created by 윤제 on 6/24/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator, LoginCoordinatorDelegate, MainCoordinatorDelegate {
    
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        isLoggedIn ? showMainView() : showLoginView()
    }
    
    private func showLoginView() {
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    private func showMainView() {
        let coordinator = MainCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    func didLogin(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showMainView()
    }
    
    func didLogout(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showLoginView()
    }

}

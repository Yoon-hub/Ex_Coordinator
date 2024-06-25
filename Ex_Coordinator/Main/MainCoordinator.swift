//
//  MainCoordinator.swift
//  Ex_Coordinator
//
//  Created by 윤제 on 6/25/24.
//

import UIKit

protocol MainCoordinatorDelegate {
    func didLogout(_ coordinator: Coordinator)
}

final class MainCoordinator: Coordinator, MainViewControllerDelegate {
    
    var delegate: MainCoordinatorDelegate?
    
    var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func didLogout() {
        delegate?.didLogout(self)
    }
    
}

//
//  LoginCoordinator.swift
//  Ex_Coordinator
//
//  Created by 윤제 on 6/25/24.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func didLogin(_ coordinator: Coordinator)
}

final class LoginCoordinator: Coordinator, LoginViewControllerDelegate {
    
    var delegate: LoginCoordinatorDelegate?
    
    var childCoordinators: [Coordinator] = []
        
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func tapLoginButton () {
        delegate?.didLogin(self)
    }	
}

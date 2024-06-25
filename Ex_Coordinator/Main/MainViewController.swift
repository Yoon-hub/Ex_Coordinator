//
//  MainViewController.swift
//  Ex_Coordinator
//
//  Created by 윤제 on 6/25/24.
//


import UIKit

protocol MainViewControllerDelegate {
    func didLogout()
}

final class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let item = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(self.logoutButtonTap))
        self.navigationItem.rightBarButtonItem = item
    }

    @objc
    private func logoutButtonTap() {
        delegate?.didLogout()
    }
}


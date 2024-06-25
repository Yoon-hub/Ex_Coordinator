//
//  ViewController.swift
//  Ex_Coordinator
//
//  Created by 윤제 on 6/24/24.
//

import UIKit

protocol LoginViewControllerDelegate {
    func tapLoginButton()
}

class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let item = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(self.loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc
    func loginButtonDidTap() {
        delegate?.tapLoginButton()
    }
}


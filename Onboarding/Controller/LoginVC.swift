//
//  RegisterVC.swift
//  SubscriptionBox
//
//  Created by Rafa Vazquez on 2/15/21.
//

import UIKit


class LoginVC: UIViewController {
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginButton()
    }
    
    func setLoginButton() {
        self.view.addSubview(loginButton)
    }
}



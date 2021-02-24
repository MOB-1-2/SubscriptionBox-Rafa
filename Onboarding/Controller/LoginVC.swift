//
//  RegisterVC.swift
//  SubscriptionBox
//
//  Created by Rafa Vazquez on 2/15/21.
//

import UIKit


class LoginVC: UIViewController {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let  username: UITextField = {
        let username = UITextField()
        username.translatesAutoresizingMaskIntoConstraints = false
        username.autocorrectionType = .no
        username.autocapitalizationType = .none
        username.font = UIFont.systemFont(ofSize: 20)
        username.text = nil
        username.placeholder = "username or email"
        return username
    }()
    
    let  password: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.autocapitalizationType = .none
        password.font = UIFont.systemFont(ofSize: 20)
        password.text = nil
        password.placeholder = "enter password"
        return password
    }()

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
        self.view.backgroundColor = #colorLiteral(red: 0.7768381238, green: 0.7722215056, blue: 0.7803876996, alpha: 1)
//        setLoginButton()
//        setPassword()
        setStackView()
    }
    
//    func setLoginButton() {
//    loginButton.addTarget(self, action: #selector(self.setHomeVC), for: .touchUpInside)
//        self.view.addSubview(loginButton)
//        NSLayoutConstraint.activate([
//            loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            loginButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
//            loginButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
    
    //    func setPassword() {
    //        self.view.addSubview(password)
    //        NSLayoutConstraint.activate([
    //            password.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    //            password.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
    //            password.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
    //            password.widthAnchor.constraint(equalTo: loginButton.widthAnchor)
    //        ])
    //    }
    
    func setStackView() {
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(username)
        stackView.addArrangedSubview(password)
        stackView.addArrangedSubview(loginButton)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
//            username.widthAnchor.constraint(equalTo: self.view.widthAnchor),
//            username.heightAnchor.constraint(equalToConstant: 50),
//            password.heightAnchor.constraint(equalToConstant: 50),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.5),
        ])
    }
}



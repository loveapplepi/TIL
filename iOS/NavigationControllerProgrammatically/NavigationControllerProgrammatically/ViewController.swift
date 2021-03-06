//
//  ViewController.swift
//  NavigationControllerProgrammatically
//
//  Created by soohyeon on 17/05/2019.
//  Copyright © 2019 loveapplepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 142.0/255.0, green: 68.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 142.0/255.0, green: 68.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        loginButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        registerButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 60).isActive = true
        
        
    }
    
    @objc func onButtonPressed(_ sender: UIButton) {
        if sender == loginButton {
            let loginVC = LoginViewController()
            self.navigationController?.pushViewController(loginVC, animated: true)
        } else if sender == registerButton {
            let registerVC = RegisterViewController()
            self.navigationController?.pushViewController(registerVC, animated: true)
        }
    }


}


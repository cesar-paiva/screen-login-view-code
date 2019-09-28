//
//  LoginViewController.swift
//  ViewCodeApp
//
//  Created by Cesar Paiva on 22/06/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func loadView() {
        view = LoginView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension LoginViewController: LoginDelegate {
    func userDidInputPhone(_ phone: String) {
        print("Usuário digitou o telefone \(phone)")
    }
}

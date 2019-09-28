//
//  LoginView.swift
//  ViewCodeApp
//
//  Created by Cesar Paiva on 22/06/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

protocol LoginDelegate: class {
    func userDidInputPhone(_ phone: String)
}

class LoginView: UIView {

    weak var delegate: LoginDelegate?
    var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Vamos começar"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var labelBody: UILabel = {
        let label = UILabel()
        label.text = "O primeiro passo do cadastro é informar seu número do Whatsapp.\nEnviaremos um código para validar seu número, ele será seu login"
        label.numberOfLines = 0
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let textFieldPhone: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Número do Whatsapp"
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 6
        button.backgroundColor = .blue
        button.setTitle("Cadastrar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(delegate: LoginDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }
    
    func setupComponents() {
        addSubview(labelTitle)
        addSubview(labelBody)
        addSubview(textFieldPhone)
        addSubview(startButton)
    }
    
    func setupConstraints() {
        labelTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        labelBody.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 20).isActive = true
        labelBody.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor, constant: 0).isActive = true
        labelBody.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor, constant: 0).isActive = true
        
        textFieldPhone.topAnchor.constraint(equalTo: labelBody.bottomAnchor, constant: 20).isActive = true
        textFieldPhone.leadingAnchor.constraint(equalTo: labelBody.leadingAnchor, constant: 0).isActive = true
        textFieldPhone.trailingAnchor.constraint(equalTo: labelBody.trailingAnchor, constant: 0).isActive = true
        
        startButton.leadingAnchor.constraint(equalTo: textFieldPhone.leadingAnchor, constant: 0).isActive = true
        startButton.trailingAnchor.constraint(equalTo: textFieldPhone.trailingAnchor, constant: 0).isActive = true
        startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 15).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .white
        startButton.addTarget(self, action: #selector(userDidInputPhone), for: .touchUpInside)
    }
    
    @objc func userDidInputPhone() {
        if let phoneNumber = textFieldPhone.text {
            delegate?.userDidInputPhone(phoneNumber)
        }
    }
    

}

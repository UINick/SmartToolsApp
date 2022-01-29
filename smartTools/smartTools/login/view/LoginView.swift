//
//  LoginView.swift
//  smartTools
//
//  Created by Nicholas Forte on 29/01/22.
//

import UIKit
import SnapKit

class LoginView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var lblUserName: UILabel = {
       let lb = UILabel()
        lb.text = "Nome"
        return lb
    }()
    
    lazy var nameTextField: UITextField = {
       let tf = UITextField()
        tf.layer.cornerRadius = 24
        
        return tf
    }()
    
    lazy var lblUserEmail: UILabel = {
       let lb = UILabel()
        lb.text = "E-mail"
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
       let tf = UITextField()
        tf.layer.cornerRadius = 24
        
        return tf
    }()
    
    lazy var btnContinuar: UIButton = {
       let btn = UIButton()
        btn.layer.cornerRadius = 24
        btn.backgroundColor = .orange
        btn.titleLabel?.text = "Continuar"
        return btn
    }()
    
    lazy var btnFazerCadastro: UIButton = {
       let btn = UIButton()
        btn.titleLabel?.text = "Quero me cadastrar"
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.titleLabel?.textColor = .green
        return btn
    }()
    
    func setupLayout() {
        
        self.addSubview(lblUserName)
        lblUserName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.left.equalToSuperview().offset(16)
        }
        
        self.addSubview(nameTextField)
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(lblUserName.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(16)
        }
        
        self.addSubview(lblUserEmail)
        lblUserEmail.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(25)
            $0.left.equalToSuperview().offset(16)
        }
        
        self.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(lblUserEmail.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(16)
        }
        
    }
}

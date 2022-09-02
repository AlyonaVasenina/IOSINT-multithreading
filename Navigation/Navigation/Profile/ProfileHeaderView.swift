//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alena Vasenina on 18.11.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let avatarImageView: UIImageView = {
        var avatar = UIImageView(image: UIImage(named: "cat"))
        avatar.contentMode = .scaleAspectFill
        avatar.layer.cornerRadius = 86/2
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 3
        return avatar
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let statusLabel: UILabel = {
        var label = UILabel()
        label.text = "Waiting for something..."
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    lazy var statusTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Waiting for something..."
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        return textField
    }()
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private var statusText = String()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(avatarImageView, fullNameLabel, statusLabel, statusTextField, setStatusButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? ""
    }
    
    @objc func buttonPressed(){
        statusLabel.text = statusText
    }
    
    func setupConstraints(){
        
        avatarImageView.toAutoLayout()
        fullNameLabel.toAutoLayout()
        statusLabel.toAutoLayout()
        statusTextField.toAutoLayout()
        setStatusButton.toAutoLayout()
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 86),
            avatarImageView.widthAnchor.constraint(equalToConstant: 86),
        
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
            fullNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        
            statusLabel.leftAnchor.constraint(equalTo: fullNameLabel.leftAnchor),
            statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -18),
        
            statusTextField.leftAnchor.constraint(equalTo: statusLabel.leftAnchor),
            statusTextField.rightAnchor.constraint(equalTo: statusLabel.rightAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 6),
        
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 34),
            setStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

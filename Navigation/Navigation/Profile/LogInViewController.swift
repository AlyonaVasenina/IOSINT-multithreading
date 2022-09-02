//
//  LogInViewController.swift
//  Navigation
//
//  Created by Alena Vasenina on 30.11.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    let logInView = LogInView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(logInView)
        setupConstraints()
        logInView.tapLoginHandler = { [weak self] in self?.showProfile() }
    }
    
    func setupConstraints() {
        
        logInView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            logInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logInView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            logInView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            logInView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    func showProfile() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
}

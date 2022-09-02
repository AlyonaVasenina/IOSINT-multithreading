//
//  FeedVC.swift
//  Navigation
//
//  Created by Alena Vasenina on 28.10.2021.
//

import UIKit

class FeedVC: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubviews(button1, button2)
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private lazy var button1: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(didTapPost), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapPost), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Home"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(stackView)
        setupConstraints()
    }
    
    @objc func didTapPost() {
        let postVC = PostVC(post: Post.test1)
        navigationController!.pushViewController(postVC, animated: true)
    }
    
    func setupConstraints() {
        
        stackView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}


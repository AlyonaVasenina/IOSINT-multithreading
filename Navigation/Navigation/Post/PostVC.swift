//
//  PostVC.swift
//  Navigation
//
//  Created by Alena Vasenina on 28.10.2021.
//

import UIKit

class PostVC: UIViewController {
    
    let post: Post
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
        title = post.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"),
                                                            style: .plain, target: self, action: #selector(didTabInfo))
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTabInfo() {
        let infoVC = InfoVC()
        present(infoVC, animated: true)
    }
}

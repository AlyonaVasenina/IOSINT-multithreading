//
//  FeedNavVC.swift
//  Navigation
//
//  Created by Alena Vasenina on 28.10.2021.
//

import UIKit

class FeedNavVC: UINavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [FeedVC()]
        tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house"), tag: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

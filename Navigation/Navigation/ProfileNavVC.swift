//
//  ProfileNavVC.swift
//  Navigation
//
//  Created by Alena Vasenina on 28.10.2021.
//

import UIKit

class ProfileNavVC: UINavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [LogInViewController()]
        tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        navigationBar.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

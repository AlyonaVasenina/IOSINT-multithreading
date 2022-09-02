//
//  AppDelegate.swift
//  Navigation
//
//  Created by Alena Vasenina on 26.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private lazy var tabBarController: UITabBarController = {
        let result = UITabBarController()
        result.viewControllers = [FeedNavVC(), ProfileNavVC()]
        return result
    }()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = tabBarController
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}


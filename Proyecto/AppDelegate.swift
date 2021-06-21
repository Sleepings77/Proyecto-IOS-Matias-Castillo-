//
//  AppDelegate.swift
//  Proyecto
//
//  Created by InfinixSoft on 08/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let initialview = UINavigationController(rootViewController: LogInViewController())
        
        window.rootViewController = initialview
        
        window.makeKeyAndVisible()
        
        return true
    }
    
    func creatTabBar() -> UITabBarController{
        let tabBar = UITabBarController()
        tabBar.viewControllers = [LogInViewController()]
        return tabBar
    }
}







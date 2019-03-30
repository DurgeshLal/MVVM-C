//
//  AppDelegate.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        self.window?.rootViewController = navigationController
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
        let flowCoordinator = AppFlowCoordinator(navigationController)
        flowCoordinator.start()
        
        return true
    }
}

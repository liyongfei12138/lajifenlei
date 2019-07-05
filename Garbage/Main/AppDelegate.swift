//
//  AppDelegate.swift
//  QCStock
//
//  Created by Bingo on 2019/7/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let mainVc = MainViewController()
        self.window?.rootViewController = mainVc
        self.window?.makeKeyAndVisible()
//        self.window
        
        return true
    }


}


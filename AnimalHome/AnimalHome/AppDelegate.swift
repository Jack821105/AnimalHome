//
//  AppDelegate.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/2.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .clear
        self.window?.rootViewController = LoadingViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
}


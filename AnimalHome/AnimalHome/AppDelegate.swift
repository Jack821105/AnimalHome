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
        
        setupNavigationBarAppearance()
        
        setupTabBarAppearance()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let landingVC = LoadingViewController()
        let nav = UINavigationController(rootViewController: landingVC)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
        
        
        return true
    }
    
    
    
    
}

// MARK: - Custom Methods

extension AppDelegate {
    
    func setupNavigationBarAppearance() {
        
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
        
        if #available(iOS 13.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            navigationBarAppearance.backgroundColor = .themeColor
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.getPintFang(ofSize: 22, weight: .medium)]
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            if #available(iOS 15.0, *) {
                UINavigationBar.appearance().compactScrollEdgeAppearance = navigationBarAppearance
            }
        } else {
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().barTintColor = .themeColor
        }
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
    }
    
    func setupTabBarAppearance() {
        
        if #available(iOS 13.0, *) {
            let barAppearance = UITabBarAppearance()
            barAppearance.configureWithDefaultBackground()
            barAppearance.backgroundColor = .themeColor
            barAppearance.stackedLayoutAppearance.normal.iconColor = .gray134Color
            barAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray134Color]
            barAppearance.stackedLayoutAppearance.selected.iconColor = .white
            barAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
            UITabBar.appearance().standardAppearance = barAppearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = barAppearance
            }
        } else {
            UITabBar.appearance().barTintColor = .themeColor
            UITabBar.appearance().tintColor = .white
            UITabBar.appearance().unselectedItemTintColor = .gray134Color
        }
    }
}

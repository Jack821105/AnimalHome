//
//  MainTabBarController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/2.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private lazy var AnimalVC: AnimalViewController = {
        let vc = AnimalViewController()
        return vc
    }()
    
    private lazy var vc2: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .yellow
        return vc
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        self.tabBar.backgroundColor = .orange
        setupViewController()
    }
    

    
    private func setupViewController() {
        let na1 = UINavigationController(rootViewController: AnimalVC)
        let na2 = UINavigationController(rootViewController: vc2)
        
        viewControllers = [na1, na2]
        
        let tabOneBarItem1 = UITabBarItem(title: "主頁", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        let tabOneBarItem2 = UITabBarItem(title: "關於", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        na1.tabBarItem = tabOneBarItem1
        na2.tabBarItem = tabOneBarItem2
    }
    
    
    
}

// MARK: - UITabBarDelegate

extension MainTabBarController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let title = item.title
        self.navigationController?.title = title
        self.navigationController?.navigationBar.tintColor = .red
    }
    
}

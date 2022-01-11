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
        

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .themeColor
        setupViewController()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 拉取並啟用 AppConfig
        ConfigModel.shared.fetchAndActivate()
    }

    
    private func setupViewController() {
        let na1 = UINavigationController(rootViewController: AnimalVC)
        
        viewControllers = [na1]
        
        let tabOneBarItem1 = UITabBarItem(title: "主頁", image: UIImage(named: "mainTabIcon"), selectedImage: UIImage(named: "selectedImage.png"))
        na1.tabBarItem = tabOneBarItem1


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

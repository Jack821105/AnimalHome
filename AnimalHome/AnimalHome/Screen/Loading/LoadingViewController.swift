//
//  LoadingViewController.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/2.
//

import UIKit



class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        goToMainTab()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
    }
    
    private func goToMainTab() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let vc = MainTabBarController()
        appDelegate.window?.rootViewController = vc
    }
    

}

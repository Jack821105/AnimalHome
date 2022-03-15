//
//  UIViewInstantiable.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import UIKit

/// 讓UIView與同名的xib檔建立連結
protocol UIViewInstantiable {
    static var nibName: String { get }
}

extension UIViewInstantiable {
    static var nibName: String { return String(describing: self) }
    
    static func instantiate() -> Self {
        let instance = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as! Self
        return instance
    }
    
    static func instantiate(withName: String) -> Self {
        let instance = Bundle.main.loadNibNamed(withName, owner: self, options: nil)?.first as! Self
        return instance
    }
}

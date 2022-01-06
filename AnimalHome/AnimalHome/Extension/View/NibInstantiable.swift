//
//  NibInstantiable.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import UIKit


protocol NibInstantiable {
    
    static var nibName: String { get }
    
    static var nibBundle: Bundle { get }
}

extension NibInstantiable {
    
    static var nibName: String { return String(describing: self) }
    
    static var nibBundle: Bundle { return Bundle(for: MyClass.self) }
    
    static func getNib() -> UINib {
        return UINib(nibName: nibName, bundle: nibBundle)
    }
    
    static func instantiateFirstView(owner: Any? = nil) -> Self {
        let nib = UINib(nibName: nibName, bundle: nibBundle)
        return nib.instantiate(withOwner: owner).first as! Self
    }
    
    
}

fileprivate class MyClass {}

//
//  Ext_UIFont.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/7.
//

import UIKit

extension UIFont {
    
    static func getWeightString(weight: Weight) -> String {
        
        switch weight {
        case .regular:
            return "Regular"
        case .medium:
            return "Medium"
        case .semibold:
            return "Semibold"
        default:
            return "Regular"
        }
    }
    
    static func getPintFang(ofSize size: CGFloat, weight: Weight = .regular) -> UIFont {
        let weightStr = getWeightString(weight: weight)
        let font = UIFont(name: "PingFangTC-\(weightStr)", size: size)
        return font ?? .systemFont(ofSize: size, weight: weight)
    }
}


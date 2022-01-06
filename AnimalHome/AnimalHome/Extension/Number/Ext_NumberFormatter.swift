//
//  Ext_NumberFormatter.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

extension NumberFormatter {
    
    static var decimalEzForm: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    static var noneEzForm: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()
    
}

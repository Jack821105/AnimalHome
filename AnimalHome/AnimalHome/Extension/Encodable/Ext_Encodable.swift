//
//  Ext_Encodable.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

extension Encodable {
    
    var string: String? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
}


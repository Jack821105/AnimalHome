//
//  ReloadTime.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

struct ReloadTime: Equatable, Comparable {
    var hour: Int
    var min: Int
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        if lhs.hour == rhs.hour {
            return lhs.min == rhs.min
        } else {
            return false
        }
    }
    
    static func < (lhs: ReloadTime, rhs: ReloadTime) -> Bool {
        if lhs.hour != rhs.hour {
            return lhs.hour < rhs.hour
        } else {
            return lhs.min < rhs.min
        }
    }
    
}

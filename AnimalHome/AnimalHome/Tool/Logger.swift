//
//  Logger.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

/// 簡易版印log工具
class Logger {
    
    /// 輸出訊息
    static func log<T>(_ message: T) {
        #if DEBUG
        print(message)
        #endif
    }
    
}

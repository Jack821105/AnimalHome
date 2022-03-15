//
//  FileDataCacheConfig.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

struct FileDataCacheConfig {
    /// 快取時間
    let cacheTime: Double?
    
    /// 重新reload的時刻
    let reloadTimes: [ReloadTime]
    
    init(cacheTime: Double) {
        self.cacheTime = cacheTime
        self.reloadTimes = []
    }
    
    init(reloadTimes: [ReloadTime]) {
        self.reloadTimes = reloadTimes
        self.cacheTime = nil
    }
    
}

extension FileDataCacheConfig {
    /// 10分鐘
    static var tenMin: FileDataCacheConfig {
        FileDataCacheConfig(cacheTime: 10 * 60)
    }
    
    /// 5分鐘
    static var fiveMin: FileDataCacheConfig {
        FileDataCacheConfig(cacheTime: 5 * 60)
    }
    
    /// 一小時
    static var oneHour: FileDataCacheConfig {
        FileDataCacheConfig(cacheTime: 60 * 60)
    }
    
    #if DEBUG
    /// 零快取
    static var zero: FileDataCacheConfig {
        FileDataCacheConfig(cacheTime: 0)
    }
    /// 10秒快取
    static var tenSec: FileDataCacheConfig {
        FileDataCacheConfig(cacheTime: 10)
    }
    #endif
    
}

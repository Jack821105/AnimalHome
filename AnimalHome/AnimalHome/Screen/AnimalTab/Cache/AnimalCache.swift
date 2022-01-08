//
//  AnimalCache.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

class AnimalCache: FileDataProviderBase<[Animal]> {
    
    static let shared: AnimalCache = AnimalCache()
    
    private override init() {}
    
    override var config: FileDataCacheConfig {
        .oneHour
    }
    
    override func updateCache(callback: @escaping ((FileDataProviderBase<[Animal]>.CacheData) -> Void), errorHandler: @escaping ((Error) -> Void)) {
        
        APIManager.shared.send { dateInfo in
            let animal = dateInfo.data
            callback(animal)
        } errorHandler: { _ in
            
        }

    }
    
}

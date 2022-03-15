//
//  OtherCache.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/9.
//

import Foundation

class OtherCache: FileDataProviderBase<[Animal]> {
    
    
    // MARK: - Prototype
    
    static let shared: OtherCache = OtherCache()
    
    override var config: FileDataCacheConfig {
        .oneHour
    }
    
    // MARK: - Init
    
    private override init() {}
    
    
    // MARK: - Custom Method
    
    override func updateCache(callback: @escaping ((FileDataProviderBase<[Animal]>.CacheData) -> Void), errorHandler: @escaping ((Error) -> Void)) {
        APIManager.shared.send(animalType: .other) { infos in
            let animalInfos = infos.data
            callback(animalInfos)
        } errorHandler: { _ in
            
        }

    }
    
    
}

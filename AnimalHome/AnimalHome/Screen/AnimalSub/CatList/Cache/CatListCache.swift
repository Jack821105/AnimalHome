//
//  CatListCache.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/9.
//

import Foundation


class CatListCache: FileDataProviderBase<[Animal]> {
    
    static let shared: CatListCache = CatListCache()
    
    private override init() {}
    
    override var config: FileDataCacheConfig {
        .oneHour
    }
    
    override func updateCache(callback: @escaping ((FileDataProviderBase<[Animal]>.CacheData) -> Void), errorHandler: @escaping ((Error) -> Void)) {
        APIManager.shared.send(animalType: .cat) { infos in
            let animalInfos = infos.data
            callback(animalInfos)
        } errorHandler: { _ in
            
        }

    }
    
}

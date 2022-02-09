//
//  DogListCahce.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/9.
//

import Foundation


class DogListCahce: FileDataProviderBase<[Animal]> {
    
    // MARK: - Prototype
    
    static let shared: DogListCahce = DogListCahce()
    
    override var config: FileDataCacheConfig {
        .oneHour
    }
    
    // MARK: - Init
    
    private override init() {}
    
    
    // MARK: - Custom Method
    
    override func updateCache(callback: @escaping ((FileDataProviderBase<[Animal]>.CacheData) -> Void), errorHandler: @escaping ((Error) -> Void)) {
        APIManager.shared.send(animalType: .dog) { infos in
            let animalInfos = infos.data
            callback(animalInfos)
        } errorHandler: { _ in
            
        }

    }
    
}

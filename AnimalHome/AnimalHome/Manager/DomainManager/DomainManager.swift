//
//  DomainManager.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation


class DomainManager {
    
    static let shared: DomainManager = DomainManager()
    
    private init() {}
    
    var domain: String = ServerDomain.online.rawValue
    
    
    enum ServerDomain: String, CaseIterable {
        case online = "https://data.coa.gov.tw/api/v1/"
    }
}


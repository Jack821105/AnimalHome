//
//  OtherListViewModel.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/9.
//

import Foundation

// MARK: - DogListViewModelDelegate

protocol OtherListViewModelDelegate: AnyObject {
    
    func updateInfo()
    
}

class OtherListViewModel {
    
    private(set) var infos: [Animal] = []
    
    
    weak var delegate: OtherListViewModelDelegate?
    
    func fetchAPI() {
        OtherCache.shared.getData { infos in
            self.infos = infos
            self.delegate?.updateInfo()
        } errorHandler: { _ in
            
        }
        
    }
    
}

//
//  CatListViewModel.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/9.
//

import Foundation

// MARK: - DogListViewModelDelegate

protocol CatListViewModelDelegate: AnyObject {
    
    func updateInfo()
    
}


class CatListViewModel {
    
    private(set) var infos: [Animal] = []
    
    weak var delegate: CatListViewModelDelegate?
    
    
    func fetchAPI() {
        CatListCache.shared.getData { infos in
            self.infos = infos
            self.delegate?.updateInfo()
        } errorHandler: { _ in
            
        }

    }
    
}

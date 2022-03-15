//
//  DogListViewModel.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/9.
//

import Foundation

// MARK: - DogListViewModelDelegate

protocol DogListViewModelDelegate: AnyObject {
    
    func updateInfo()
    
}

class DogListViewModel {
    
    private(set) var infos: [Animal] = []
    
    weak var delegate: DogListViewModelDelegate?
    
    
    func fetchAPI() {
        DogListCahce.shared.getData { infos in
            self.infos = infos
            self.delegate?.updateInfo()
        } errorHandler: { _ in
            
        }
        
    }
    
}

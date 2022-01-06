//
//  AnimalViewModel.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/7.
//

import Foundation

 
protocol AnimalViewModelDelegate: AnyObject {
    
    func updateInfo()
    
}


class AnimalViewModel {
    
    private(set) var dogInfos: [Animal] = []
    
    private(set) var catInfos: [Animal] = []
    
    weak var delegate: AnimalViewModelDelegate?
    
    func featchAPI() {
        
        AnimalCache.shared.getData { animalList in
            self.classifyAnimalType(animalList: animalList)
            self.delegate?.updateInfo()
        } errorHandler: { _ in
            
        }

    }
    
    /// 歸類動物種類
    private func classifyAnimalType(animalList: [Animal]) {
        
        self.dogInfos = animalList.filter {
            $0.animalType == .dog
        }
        self.catInfos = animalList.filter {
            $0.animalType == .cat
        }
        
    }
    
    
    
}

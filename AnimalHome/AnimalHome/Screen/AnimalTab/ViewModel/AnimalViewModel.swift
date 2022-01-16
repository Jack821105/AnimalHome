//
//  AnimalViewModel.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/7.
//

import Foundation
import UIKit

 
protocol AnimalViewModelDelegate: AnyObject {
    
    func updateInfo()
    
}


class AnimalViewModel {
    
    private var dogInfos: [Animal] = []
    
    private var catInfos: [Animal] = []
    
    var currentAnimalType: AnimalViewController.AnimalType = .dog
    
    var currentCellType: AnimalViewController.CellType = .photo
    
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
    
    func getCurrntTypeInfos() -> [Animal] {
        
        switch currentAnimalType {
            case .dog:
                return dogInfos
            case .cat:
                return catInfos
        }
    }
    
}

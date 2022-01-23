//
//  MyFavoriteViewModel.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/23.
//

import Foundation

class MyFavoriteViewModel {
    
    
    func getFileData() -> [Animal] {
        return MyFavoriteManager.shared.readData()
    }
    
}

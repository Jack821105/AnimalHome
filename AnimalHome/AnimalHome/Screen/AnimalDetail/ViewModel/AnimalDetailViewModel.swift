//
//  AnimalDetailViewModel.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/3/1.
//

import Foundation


class AnimalDetailViewModel {
    
    func writeData(info: Animal) {
        var readData = MyFavoriteManager.shared.readData()
        readData.append(info)
        MyFavoriteManager.shared.writeData(saveDate: readData)
    }
}

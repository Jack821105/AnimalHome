//
//  MyFavoriteViewModel.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/23.
//

import Foundation

protocol MyFavoriteViewModelDelegate: AnyObject {
    func update()
}


class MyFavoriteViewModel {
    
    weak var delegate: MyFavoriteViewModelDelegate?
    
    
    func getFileData() -> [Animal] {
        print("JACK DEV \(MyFavoriteManager.shared.readData().count)")
        return MyFavoriteManager.shared.readData()
    }
    
}

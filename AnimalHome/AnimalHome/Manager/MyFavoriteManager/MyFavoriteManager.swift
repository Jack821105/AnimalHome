//
//  MyFavoriteManager.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/22.
//

import Foundation


class MyFavoriteManager {
    
    static let shared: MyFavoriteManager = MyFavoriteManager()
    
    // 透過路徑尋找URL
    private static let path = NSHomeDirectory() + "/Document"
    
    private let urlfrompath = URL(fileURLWithPath: MyFavoriteManager.path)
    
    // 直接拿取URL，陣列第0個是資料夾本身(雖然也只有一個url)
    private let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    private init() {}
    
    
    func writeData(saveDate: [Animal]) {
        do {
            if let animalDatas = try? JSONEncoder().encode(saveDate),
               let animalStr = String(data: animalDatas, encoding: .utf8) {
                try animalStr.write(to: urlfrompath, atomically: true, encoding: .utf8)
                print("寫入成功")
            }
        } catch {
            print("寫入失敗")
        }
    }
    
    func readData() -> [Animal] {
        do {
            let readStr = try String(contentsOf: urlfrompath, encoding: .utf8)
            print("JACK DEV \(readStr)")
            if let readData = readStr.data(using: .utf8) {
                if let animalDatas = try? JSONDecoder().decode([Animal].self, from: readData) {
                    return animalDatas
                }
            }
        } catch {
            print("JACK DEV 失敗")
            return []
        }
        return []
    }
}

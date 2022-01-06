//
//  AnimalCache.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

class AnimalCache: FileDataProviderBase<[Animal]> {
    
    static let shared: AnimalCache = AnimalCache()
    
    private override init() {}
    
    override var config: FileDataCacheConfig {
        .tenMin
    }
    
    override func updateCache(callback: @escaping ((FileDataProviderBase<[Animal]>.CacheData) -> Void), errorHandler: @escaping ((Error) -> Void)) {
        
        APIManager.shared.send { dateInfo in
            let animal = dateInfo.data
            callback(animal)
        } errorHandler: { _ in
            
        }

    }
    
    
}
    

struct AnimalList: Codable {
    
    let data: [Animal]
    
    enum CodingKeys: String ,CodingKey {
        case data = "Data"
    }
}




struct Animal: Codable {
    
    /// 身份辨識
    let id: Int
    
    /// 寵物種類
    let animalType: animalType?
    
    /// 年紀
    let age: String?
    
    /// 性別
    let sex: String?
    
    /// 體型
    let bodytype: Bodytype?
    
    /// 顏色
    let colour: String?
    
    /// 施打狂犬病疫苗
    let bacterin: String?
    
    /// 是否絕育
    let sterilization: String?
    
    /// 發現地
    let foundplace: String?
    
    /// 動物所屬收容所名稱
    let shelterName: String?
    
    /// 動物所屬收容所地址
    let shelterAddress: String?
    
    /// 動物所屬收容所電話
    let shelterTel: String?
    
    /// 資料備註
    let remark: String?
    
    let urlImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "animal_id"
        case animalType = "animal_kind"
        case age = "animal_age"
        case sex = "animal_sex"
        case bodytype = "animal_bodytype"
        case colour = "animal_colour"
        case sterilization = "animal_sterilization"
        case bacterin = "animal_bacterin"
        case foundplace = "animal_foundplace"
        case shelterName = "shelter_name"
        case shelterAddress = "shelter_address"
        case shelterTel = "shelter_tel"
        case remark = "animal_remark"
        case urlImage = "album_file"
        
    }
    
    
    enum animalType: String, Codable {
        case dog = "狗"
        case cat = "貓"
        case other = ""
    }
    
    enum Bodytype: String, Codable {
        case small = "SMALL"
        case medium = "MEDIUM"
        case big = "BIG"
    }
}

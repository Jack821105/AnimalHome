//
//  Animal.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/9.
//

import Foundation

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
    let animalType: AnimalType?
    
    /// 年紀
    let age: String?
    
    /// 性別
    let sex: SexType?
    
    /// 體型
    let bodytype: BodyType?
    
    /// 顏色
    let colour: String?
    
    /// 施打狂犬病疫苗
    let bacterin: BacterinType?
    
    /// 是否絕育
    let sterilization: SterilizationType?
    
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
    
    /// 圖片來源
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
    
    
    enum AnimalType: String, Codable {
        case dog = "狗"
        case cat = "貓"
        case other = ""
    }
    
    enum BodyType: String, Codable {
        case small = "SMALL"
        case medium = "MEDIUM"
        case big = "BIG"
        
        func getTitle() -> String {
            switch self {
            case .small:
                return "小型"
            case .medium:
                return "中型"
            case .big:
                return "大型"
            }
        }
        
    }
    
    enum SexType: String, Codable {
        case f = "F"
        case m = "M"
        case nono = "N"
        
        func getTitle() -> String {
            switch self {
            case .f:
                return "母"
            case .m:
                return "公"
            case .nono:
                return "未知"
            }
        }
    }
    
    enum BacterinType: String, Codable {
        
        case f = "F"
        
        case t = "T"
        
        func getTitle() -> String {
            switch self {
            case .f:
                return "未施打狂犬病疫苗"
            case .t:
                return "已施打狂犬病疫苗"
            }
        }
    }
    
    enum SterilizationType: String, Codable {
        
        case f = "F"
        
        case t = "T"
        
        func getTitle() -> String {
            switch self {
            case .f:
                return "未絕育"
            case .t:
                return "已絕育"
            }
        }
    }
    
}

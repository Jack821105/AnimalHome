//
//  GeneralTool.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

class GeneralTool: NSObject {
    
    
    /// Json的Decoder方式
    @available(*, deprecated, message: "")
    static func jsonDecoder<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    
}

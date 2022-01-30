//
//  APIManager.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation
import Alamofire
import UIKit


class APIManager {
    
    static let shared: APIManager = APIManager()
    
    private let urlStr: String = "https://data.coa.gov.tw/api/v1/AnimalRecognition/"
    
    private init() {}
    
    func send(completionHandler: ((AnimalList) -> Void)?, errorHandler: @escaping ((Error) -> Void?)) {
        guard let url = URL(string: urlStr) else { return }
        
        AF.request(url).response { (afResponse: AFDataResponse<Data?>) in
            if let afError = afResponse.error {
                errorHandler(afError)
            } else if let data = afResponse.data {
                if let decoder = try? JSONDecoder().decode(AnimalList.self, from: data) {
                    completionHandler?(decoder)
                }
            }
        }
    }
    
}

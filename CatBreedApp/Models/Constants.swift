//
//  Constants.swift
//  RickAndMorty
//
//  Created by Jan Kaltoun on 29.01.2022.
//

import Foundation

enum Constants {
    static let baseAPIUrl = URL(string: "https://api.thecatapi.com/v1/")!
    
    static func getApiKey() -> String? {
        return Bundle.main.infoDictionary?["api.thecatapi.com-API_KEY"] as? String
    }
}

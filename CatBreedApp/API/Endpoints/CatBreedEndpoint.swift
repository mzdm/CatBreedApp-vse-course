//
//  CatBreedEndpoint.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import Foundation

enum CatBreedEndpoint: Endpoint {
    
    case getCatBreeds(page: Int?)
    
    var path: String {
        switch self {
        case .getCatBreeds:
            return "images/search"
        }
    }
    
    var urlParameters: [String : String] {
        switch self {
        case .getCatBreeds(let page?):
            return [
                "page": String(page),
                "order": "ASC",
                "has_breeds": "1",
                "limit" : "10"
            ]
        case .getCatBreeds:
            return [
                "page": "1",
                "order": "ASC",
                "has_breeds": "1",
                "limit" : "10"
            ]
        }
        
    }
}

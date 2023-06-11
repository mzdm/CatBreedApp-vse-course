//
//  CatBreedEndpoint.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import Foundation

enum CatBreedEndpoint: Endpoint {
    
    case getCatBreeds
    
    var path: String {
        switch self {
        case .getCatBreeds:
            return "breeds"
        }
    }
    
    var urlParameters: [String : String] {
        switch self {
        case .getCatBreeds:
            return [
                :
            ]
        }
        
    }
}

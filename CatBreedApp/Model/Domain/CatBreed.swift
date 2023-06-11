//
//  CatBreed.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let catBreedModelElement = try? newJSONDecoder().decode(CatBreedModelElement.self, from: jsonData)
struct CatBreed: Codable {
    let breeds: [CatBreedMetadata]?
    let id: String?
    let url: String?
    let width, height: Int?
}

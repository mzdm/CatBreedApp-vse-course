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

// MARK: - Conformances
extension CatBreed: Identifiable {}
extension CatBreed: Equatable {
    static func == (lhs: CatBreed, rhs: CatBreed) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Mock
#if DEBUG
extension CatBreed {
    static let mock: CatBreed = .init(
        breeds: [CatBreedMetadata.mock(i: 0)],
        id: "aege_0",
        url: "https://cdn2.thecatapi.com/images/bGUQ04k2E.jpg",
        width: 764,
        height: 680
    )
    
    static let catBreeds: [CatBreed] = {
        (0 ... 20).map {
            CatBreed(
                breeds: [CatBreedMetadata.mock(i:$0)],
                id: "aege_\($0)",
                url: "https://cdn2.thecatapi.com/images/bGUQ04k2E.jpg",
                width: 764,
                height: 680
            )
        }
    }()
}
#endif

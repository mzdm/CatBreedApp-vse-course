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
    var weight: Weight?
    var id, name: String?
    var cfaURL: String?
    var vetstreetURL: String?
    var vcahospitalsURL: String?
    var temperament, origin, countryCodes, countryCode: String?
    var description, lifeSpan: String?
    var indoor, lap: Int?
    var altNames: String?
    var adaptability, affectionLevel, childFriendly, dogFriendly: Int?
    var energyLevel, grooming, healthIssues, intelligence: Int?
    var sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int?
    var experimental, hairless, natural, rare: Int?
    var rex, suppressedTail, shortLegs: Int?
    var wikipediaURL: String?
    var hypoallergenic: Int?
    var referenceImageID: String?
    var image: BreedImage?
    var catFriendly, bidability: Int?

    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case cfaURL = "cfa_url"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
        case temperament, origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case description
        case lifeSpan = "life_span"
        case indoor, lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, experimental, hairless, natural, rare, rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
        case referenceImageID = "reference_image_id"
        case image
        case catFriendly = "cat_friendly"
        case bidability
    }
}

// MARK: - BreedImage
struct BreedImage: Codable {
    var id: String?
    let width, height: Int?
    let url: String?
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
    static let catBreedsMock: [CatBreed] = {
        (0 ... 20).map {
            CatBreed(
                weight: Weight(imperial: "1 - 2", metric: "3 - 4"),
                id: "aege_\($0)",
                name: "Aegean_\($0)",
                cfaURL: "http://cfa.org/Breeds/BreedsAB/Aegean.aspx",
                vetstreetURL: "http://www.vetstreet.com/cats/aegean-cat",
                vcahospitalsURL: "https://vcahospitals.com/know-your-pet/cat-breeds/aegean",
                temperament: "Affectionate, Social, Intelligent, Playful, Active",
                origin: "Greece",
                countryCodes: "GR",
                countryCode: "GR",
                description: "Native to the Greek islands known as the Cyclades in the Aegean Sea, this natural breed is medium to large, well-muscled, strong, hardy and endearing. The Aegean’s coat is always tabby, with the usual M on the forehead. The Aegean is a natural breed, adapted over time to its harsh environment. It is a sturdy, healthy cat with a semi-long, soft, silky coat without undercoat. The Aegean is a very active cat that retains its hunting instinct. It is a very intelligent cat that can be taught to perform tricks. It is also a very social cat that gets along well with other cats and children.",
                lifeSpan: "9 - 12",
                wikipediaURL: "https://en.wikipedia.org/wiki/Aegean_cat",
                hypoallergenic: 0,
                image: BreedImage(
                    width: 764,
                    height: 680,
                    url: "https://cdn2.thecatapi.com/images/bGUQ04k2E.jpg"
                )
            )
        }
    }()
}
#endif

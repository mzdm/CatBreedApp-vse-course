//
//  CatBreedMetadata.swift
//  CatBreedApp
//
//  Created by Matej Zidek on 11.06.2023.
//

import Foundation

// MARK: - CatBreedMetadata
struct CatBreedMetadata: Codable {
    let weight: Weight?
    let id, name: String?
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?
    let temperament, origin, countryCodes, countryCode: String?
    let description, lifeSpan: String?
    let indoor, lap: Int?
    let altNames: String?
    let adaptability, affectionLevel, childFriendly, catFriendly: Int?
    let dogFriendly, energyLevel, grooming, healthIssues: Int?
    let intelligence, sheddingLevel, socialNeeds, strangerFriendly: Int?
    let vocalisation, experimental, hairless, natural: Int?
    let rare, rex, suppressedTail, shortLegs: Int?
    let wikipediaURL: String?
    let hypoallergenic: Int?
    let referenceImageID: String?

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
        case catFriendly = "cat_friendly"
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
    }
}

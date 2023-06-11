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
    var indoor, lap: Int?
    var altNames: String?
    var adaptability, affectionLevel, childFriendly, catFriendly: Int?
    var dogFriendly, energyLevel, grooming, healthIssues: Int?
    var intelligence, sheddingLevel, socialNeeds, strangerFriendly: Int?
    var vocalisation, experimental, hairless, natural: Int?
    var rare, rex, suppressedTail, shortLegs: Int?
    let wikipediaURL: String?
    var hypoallergenic: Int?
    var referenceImageID: String?
    
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

// MARK: - Mock
#if DEBUG
extension CatBreedMetadata {
    static func mock(i: Int) -> CatBreedMetadata {
        return .init(
            weight: Weight(imperial: "1 - 2", metric: "3 - 4"),
            id: "aege_\(i)",
            name: "Aegean_\(i)",
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
            hypoallergenic: 0
        )
    }
    
}
#endif

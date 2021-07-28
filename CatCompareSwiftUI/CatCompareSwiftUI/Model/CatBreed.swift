//
//  Cat.swift
//  CatCompareSwiftUI
//
//  Created by James Lea on 7/27/21.
//

import Foundation

struct CatBreed: Codable, Identifiable {
    
    let id : String?
    private let name : String?
    private let description : String?
    private let temperament : String?
    private let lifeSpan : String?
    private let weight : CatWeight?
    private let catImage : CatImage?
    private let adaptability : Int?
    private let affectionLevel : Int?
    private let bidability : Int?
    private let catFriendly : Int?
    private let childFriendly : Int?
    private let dogFriendly : Int?
    private let energyLevel : Int?
    private let experimental : Int?
    private let grooming : Int?
    private let healthIssues : Int?
    private let hypoallergenic : Int?
    private let indoor : Int?
    private let intelligence : Int?
    private let lap : Int?
    private let natural : Int?
    private let sheddingLevel : Int?
    private let socialNeeds : Int?
    private let strangerFriendly : Int?
    private let vocalisation : Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, weight, description, temperament, adaptability, bidability, experimental, grooming, hypoallergenic, indoor, intelligence, lap, natural, vocalisation
        case catImage = "image"
        case affectionLevel = "affection_level"
        case catFriendly = "cat_friendly"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case healthIssues = "health_issues"
        case lifeSpan = "life_span"
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
    }
    
    var displayWeight           : String { weight?.imperial ?? "N/A"}
    var displayCatImage         : String { catImage?.url ?? "N/A"}
    var displayID               : String { id ?? "N/A"}
    var displayName             : String { name ?? "N/A"}
    var displayDescription      : String { description ?? "N/A"}
    var displayTemperament      : String { temperament ?? "N/A"}
    var displayLifeSpan         : String { lifeSpan ?? "N/A"}
    var displayAdaptability     : String { "\(adaptability ?? 0)" }
    var displayAffectionLevel   : String { "\(affectionLevel ?? 0)" }
    var displayBidability       : String { "\(bidability ?? 0)" }
    var displayCatFriendly      : String { "\(catFriendly ?? 0)" }
    var displayChildFriendly    : String { "\(childFriendly ?? 0)" }
    var displayDogFriendly      : String { "\(dogFriendly ?? 0)" }
    var displayEnergyLevel      : String { "\(energyLevel ?? 0)" }
    var displayExperimental     : String { "\(experimental ?? 0)" }
    var displayGrooming         : String { "\(grooming ?? 0)" }
    var displayHealthIssues     : String { "\(healthIssues ?? 0)" }
    var displayHypoallergenic   : String { "\(hypoallergenic ?? 0)" }
    var displayIndoor           : String { "\(indoor ?? 0)" }
    var displayIntelligence     : String { "\(intelligence ?? 0)" }
    var displayLap              : String { "\(lap ?? 0)" }
    var displayNatural          : String { "\(natural ?? 0)" }
    var displaySheddingLevel    : String { "\(sheddingLevel ?? 0)" }
    var displaySocialNeeds      : String { "\(socialNeeds ?? 0)" }
    var displayStrangerFriendly : String { "\(strangerFriendly ?? 0)" }
    var displayVocalisation     : String { "\(vocalisation ?? 0)" }
    
}

struct CatImage: Codable {
    let url: String?
}

struct CatWeight: Codable {
    let imperial: String?
}

extension CatBreed: Equatable {
    static func == (lhs: CatBreed, rhs: CatBreed) -> Bool {
        lhs.id == rhs.id
    }
}


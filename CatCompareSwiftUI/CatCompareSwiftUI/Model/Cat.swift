//
//  Cat.swift
//  CatCompareSwiftUI
//
//  Created by James Lea on 7/27/21.
//

import SwiftUI

struct TopLevelObject: Codable {
    let cats: [Cat]
}//End of struct

struct Cat: Codable {
    var name: String
    let weight: Weight
    let description: String
    let temperament: String
    let indoor: Int
    let lap: Int?
    let adaptability: Int
    let affectionLevel: Int
    let childFriendly: Int
    let dogFriendly: Int
    let energyLevel: Int
    let grooming: Int
    let healthIssues: Int
    let intelligence: Int
    let sheddingLevel: Int
    let socialNeeds: Int
    let strangerFriendly: Int
    let vocalisation: Int
    let hypoallergenic: Int
    let image: Image?
    
    enum CodingKeys: String, CodingKey {
        case name, weight, description, temperament, indoor, lap, adaptability, affectionLevel = "affection_level", childFriendly = "child_friendly", dogFriendly = "dog_friendly", energyLevel = "energy_level", grooming, healthIssues = "health_issues", intelligence, sheddingLevel = "shedding_level", socialNeeds = "social_needs", strangerFriendly = "stranger_friendly", vocalisation, hypoallergenic, image
    }
}//End of struct

struct Weight: Codable {
    let imperial: String
}//End of struct

struct Image: Codable {
    let url: String?
}//End of struct

//
//  CatCompareViewModel.swift
//  CatCompareSwiftUI
//
//  Created by Mike Conner on 7/27/21.
//

import UIKit

class CatCompareViewModel: ObservableObject {
    
    @Published var catBreeds: [CatBreed] = []
    @Published var catsToCompare: [CatBreed] = []
    
    func fetchCatBreeds() {
        NetworkManager.fetchCatBreeds { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let catBreeds):
                    self.catBreeds = catBreeds
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n\(error)")
                }
            }
        }
    }
    
    
    lazy var firstAttributeKeys: [String: Any?] = [
            "Description"           : catsToCompare[0].displayDescription,
            "Temperament"           : catsToCompare[0].displayTemperament,
            "Life Span"             : catsToCompare[0].displayLifeSpan,
            "Weight"                : catsToCompare[0].displayWeight,
            "Adaptability"          : catsToCompare[0].displayAdaptability,
            "Affection Level"       : catsToCompare[0].displayAffectionLevel,
            "Bidability"            : catsToCompare[0].displayBidability,
            "Cat Friendly"          : catsToCompare[0].displayCatFriendly,
            "Child Friendly"        : catsToCompare[0].displayChildFriendly,
            "Dog Friendly"          : catsToCompare[0].displayDogFriendly,
            "Energy Level"          : catsToCompare[0].displayEnergyLevel,
            "Experimental"          : catsToCompare[0].displayExperimental,
            "Grooming"              : catsToCompare[0].displayGrooming,
            "Health Issues"         : catsToCompare[0].displayHealthIssues,
            "Hypoallergenic"        : catsToCompare[0].displayHypoallergenic,
            "Indoor"                : catsToCompare[0].displayIndoor,
            "Intelligence"          : catsToCompare[0].displayIntelligence,
            "Lap"                   : catsToCompare[0].displayLap,
            "Natural"               : catsToCompare[0].displayNatural,
            "Shedding Level"        : catsToCompare[0].displaySheddingLevel,
            "Social Needs"          : catsToCompare[0].displaySocialNeeds,
            "SAtranger Friendly"    : catsToCompare[0].displayStrangerFriendly,
            "Vocalisation"          : catsToCompare[0].displayVocalisation
        ]
    
    lazy var secondAttributeKeys: [String: Any?] = [
            "Description"           : catsToCompare[1].displayDescription,
            "Temperament"           : catsToCompare[1].displayTemperament,
            "Life Span"             : catsToCompare[1].displayLifeSpan,
            "Weight"                : catsToCompare[1].displayWeight,
            "Adaptability"          : catsToCompare[1].displayAdaptability,
            "Affection Level"       : catsToCompare[1].displayAffectionLevel,
            "Bidability"            : catsToCompare[1].displayBidability,
            "Cat Friendly"          : catsToCompare[1].displayCatFriendly,
            "Child Friendly"        : catsToCompare[1].displayChildFriendly,
            "Dog Friendly"          : catsToCompare[1].displayDogFriendly,
            "Energy Level"          : catsToCompare[1].displayEnergyLevel,
            "Experimental"          : catsToCompare[1].displayExperimental,
            "Grooming"              : catsToCompare[1].displayGrooming,
            "Health Issues"         : catsToCompare[1].displayHealthIssues,
            "Hypoallergenic"        : catsToCompare[1].displayHypoallergenic,
            "Indoor"                : catsToCompare[1].displayIndoor,
            "Intelligence"          : catsToCompare[1].displayIntelligence,
            "Lap"                   : catsToCompare[1].displayLap,
            "Natural"               : catsToCompare[1].displayNatural,
            "Shedding Level"        : catsToCompare[1].displaySheddingLevel,
            "Social Needs"          : catsToCompare[1].displaySocialNeeds,
            "SAtranger Friendly"    : catsToCompare[1].displayStrangerFriendly,
            "Vocalisation"          : catsToCompare[1].displayVocalisation
        ]
    
    
    
} // End of class

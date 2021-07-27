//
//  CatCompareViewModel.swift
//  CatCompareSwiftUI
//
//  Created by Jenny Morales on 7/27/21.
//

import SwiftUI

final class CatCompareViewModel: ObservableObject {
    
    @Published var cats: [Cat] = []
    
    func getCats() {
        NetworkManager.fetchCats { result in
            switch result {
            case .success(let cats):
                self.cats = cats
                print("FETCHED CATS", cats)
            case .failure(let error):
                print("Error in \(#function): on line \(#line) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
}//End of class

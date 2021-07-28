//
//  SelectionCell.swift
//  CatCompareSwiftUI
//
//  Created by Mike Conner on 7/28/21.
//

import SwiftUI


struct SelectionCell: View {
    
    @ObservedObject var viewModel: CatCompareViewModel
    let catBreed: CatBreed
    @Binding var selectedBreed: [String]
    
    var body: some View {
        HStack {
            Text(catBreed.displayName)
            Spacer()
            if selectedBreed.contains(catBreed.displayName) && selectedBreed.count < 3 {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }
        .onTapGesture {
            if selectedBreed.contains(catBreed.displayName) {
                selectedBreed.remove(at: selectedBreed.firstIndex(where: { cat in
                    cat == catBreed.displayName
                })!)
                viewModel.catsToCompare.remove(at: viewModel.catsToCompare.firstIndex(where: { cat in
                    cat.displayName == catBreed.displayName
                })!)
            } else if selectedBreed.count < 2 {
                self.selectedBreed.append(self.catBreed.displayName)
                self.viewModel.catsToCompare.append(self.catBreed)
            }
        }
    }
}

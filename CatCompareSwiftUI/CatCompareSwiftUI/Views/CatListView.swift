//
//  CatListView.swift
//  CatCompareSwiftUI
//
//  Created by James Lea on 7/27/21.
//

import SwiftUI

struct CatListView: View {
    
    @StateObject var viewModel = CatCompareViewModel()
    
    @State private var selections: [String] = []
    @State private var isComparing: Bool = false
    
    var body: some View {
        VStack {
            if isComparing {
                CatComparisonView(viewModel: viewModel, isComparing: $isComparing)
            } else {
                List {
                    ForEach(self.viewModel.catsToCompare) { catBreed in
                        Text(catBreed.displayName)
                    }
                }
                NavigationView {
                    List {
                        ForEach(self.viewModel.catBreeds) { catBreed in
                            SelectionCell(viewModel: viewModel, catBreed: catBreed, selectedBreed: self.$selections)
                                .onTapGesture {
                                    self.viewModel.catsToCompare.append(catBreed)
                                }
                        }
                    }
                    .navigationTitle(Text("Cat Comparison"))
                }
                .onAppear {
                    viewModel.fetchCatBreeds()
                }
                
                Button(action: {
                    if selections.count == 2 {
                        isComparing.toggle()
                    }
                }, label: {
                    if selections.count == 2 {
                        Text("Compare")
                    } else {
                        Text("Choose two breeds")
                    }
                }).disabled(selections.count != 2)
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView()
    }
}

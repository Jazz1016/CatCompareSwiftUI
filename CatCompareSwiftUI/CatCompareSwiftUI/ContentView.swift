//
//  ContentView.swift
//  CatCompareSwiftUI
//
//  Created by James Lea on 7/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: CatCompareViewModel
    
    var body: some View {
        HStack {
            Text("Hello, world!")
        }
        .onAppear {
            viewModel.getCats()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CatCompareViewModel())
    }
}

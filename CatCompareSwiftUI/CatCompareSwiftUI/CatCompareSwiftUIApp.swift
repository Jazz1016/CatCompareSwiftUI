//
//  CatCompareSwiftUIApp.swift
//  CatCompareSwiftUI
//
//  Created by James Lea on 7/27/21.
//

import SwiftUI

@main
struct CatCompareSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CatCompareViewModel())
        }
    }
}

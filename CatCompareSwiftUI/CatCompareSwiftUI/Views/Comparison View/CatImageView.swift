//
//  CatImageView.swift
//  CatCompareSwiftUI
//
//  Created by Mike Conner on 7/28/21.
//

import SwiftUI

struct CatImageView: View {
    
    @ObservedObject var viewModel: CatCompareViewModel
    var catImageURL: String
    
    var body: some View {
        VStack(alignment: .center) {
            CatRemoteImage(urlString: catImageURL)
        }
    }
}

struct CatImageView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView(viewModel: CatCompareViewModel(), catImageURL: "url")
    }
}

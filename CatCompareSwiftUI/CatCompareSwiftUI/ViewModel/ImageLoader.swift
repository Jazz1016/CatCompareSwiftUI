//
//  ImageLoader.swift
//  CatCompareSwiftUI
//
//  Created by Mike Conner on 7/27/21.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    @Published var isLoading: Bool = true
    
    func load(fromURLString urlString: String) {
        NetworkManager.fetchCatImageURL(catImageURL: urlString) { uiImage in
            guard let uiImage = uiImage else {return}
            DispatchQueue.main.async { [self] in
                self.image = Image(uiImage: uiImage).resizable()
                self.isLoading = false
            }
        }
    }
    
} // End of class

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("noCatImage").resizable()
    }
    
} // End of struct

struct CatRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image?.resizable())
            .onAppear { imageLoader.load(fromURLString: urlString) }
            .blur(radius: !imageLoader.isLoading ? 0 : urlString.contains("noImage") ? 0 : 20)
    }
    
} // End of struct

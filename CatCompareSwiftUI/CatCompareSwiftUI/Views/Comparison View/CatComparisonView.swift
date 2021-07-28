//
//  CatComparisonView.swift
//  CatCompareSwiftUI
//
//  Created by Mike Conner on 7/27/21.
//

import SwiftUI

struct CatComparisonView: View {
    
    @ObservedObject var viewModel: CatCompareViewModel
    @Binding var isComparing: Bool
    
    var body: some View {
        GeometryReader { proxy in
            Group {
                VStack {
                    HStack {
                        ZStack {
                            Group {
                                CatImageView(viewModel: viewModel, catImageURL: viewModel.catsToCompare[0].displayCatImage)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.size.width / 2 - 10, height: proxy.size.height * 0.2, alignment: .center)
                                VStack {
                                    Text(viewModel.catsToCompare[0].displayName)
                                        .foregroundColor(.white)
                                        .fontWeight(.heavy)
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                        ZStack {
                            Group {
                                CatImageView(viewModel: viewModel, catImageURL: viewModel.catsToCompare[1].displayCatImage)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.size.width / 2 - 10, height: proxy.size.height * 0.2, alignment: .center)
                                VStack {
                                    Text(viewModel.catsToCompare[0].displayName)
                                        .foregroundColor(.white)
                                        .fontWeight(.heavy)
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                    }
                    ScrollView([.vertical]) {
                        HStack {
                            VStack {
                                let keys = viewModel.firstAttributeKeys
                                    .map { $0.key }
                                    .sorted { $0 < $1 }
                                
                                ForEach(keys, id: \.description) { key in
                                    CatAttributeCardView(catAttributeDescription: "\(key)", catAttributeValue: viewModel.firstAttributeKeys[key] as! String)
                                        .frame(width: proxy.size.width / 2 - 10, height: 100)
                                }
                            }
                            .frame(width: proxy.size.width / 2)
                            VStack {
                                let keys = viewModel.secondAttributeKeys
                                    .map { $0.key }
                                    .sorted { $0 < $1 }
                                
                                ForEach(keys, id: \.description) { key in
                                    CatAttributeCardView(catAttributeDescription: "\(key)", catAttributeValue: viewModel.secondAttributeKeys[key] as! String)
                                        .frame(width: proxy.size.width / 2 - 10, height: 100)
                                }
                            }
                            .frame(width: proxy.size.width / 2)
                        }
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Button("Dismiss me") {
                        isComparing = false
                    }
                }
            }
        }
    }
}

struct CatComparisonView_Previews: PreviewProvider {
    
    static var previews: some View {
        CatComparisonView(viewModel: CatCompareViewModel(), isComparing: .constant(true))
    }
}

//
//  CatAttributeCardView.swift
//  CatCompareSwiftUI
//
//  Created by Mike Conner on 7/27/21.
//

import SwiftUI

struct CatAttributeCardView: View {
    
    var catAttributeDescription: String
    var catAttributeValue: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .circular)
                .foregroundColor(Color(.red))
            VStack(alignment: .center) {
                Text(catAttributeDescription)
                    .multilineTextAlignment(.center)
                Text(catAttributeValue)
            }
        }
        .padding()
    }
}

struct CatAttributeCardView_Previews: PreviewProvider {
    static var previews: some View {
        CatAttributeCardView(catAttributeDescription: "Child Friendly", catAttributeValue: "5")
    }
}

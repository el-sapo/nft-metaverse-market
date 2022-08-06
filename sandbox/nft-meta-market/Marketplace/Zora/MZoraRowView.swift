//
//  MZoraRowView.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 5/8/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MZoraRowView: View {
    let item: ZoraModel
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                WebImage(url: URL(string: item.imageUrl ?? ""), options: .delayPlaceholder)
                    .resizable()
                    .placeholder(Image("zora"))
                // Supports ViewBuilder as well
                //.placeholder {
                //     Circle().foregroundColor(.gray)
                // }
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 7.0))
                    .overlay {
                        RoundedRectangle(cornerRadius: 7.0)
                            .stroke(.black, lineWidth: 2)
                    }
                    .shadow(radius: 7)
            } else {
                WebImage(url: URL(string: item.imageUrl ?? ""), options: .delayPlaceholder)
                    .resizable()
                    .placeholder(Image("zora"))
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 7.0))
            }
            VStack {
                CustomText(text: item.title, size: 17.0, textStyle: .title2)
                CustomText(text: item.description, size: 14.0, textStyle: .title2)
            }
            
        }
    }
}

struct MZoraRowView_Previews: PreviewProvider {
    static var previews: some View {
        MZoraRowView(item: ZoraModel(id: 1, items: [:], collection: nil))
    }
}

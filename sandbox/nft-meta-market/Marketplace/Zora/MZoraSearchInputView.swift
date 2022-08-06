//
//  MZoraSearchInputView.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 5/8/22.
//

import SwiftUI

struct SearchModel: Equatable {
    var text: String?
    var collection: String?
}

struct MZoraSearchInputView: View {
    @Binding var searchModel: SearchModel

    @State var collection: String = ""
    @State var text: String = ""
    
    var inputCollection = false
    var inputCompletion: ((SearchModel)->())?
    
    var body: some View {
        VStack {
            if inputCollection {
                TextField("search collection", text: $text)
                    .frame(height: 35.0, alignment: .leading)
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 5.0)
            }
            TextField("search words", text: $collection)
                .font(Font.customFont(size: 17.0, textStyle: .title2))
                .frame(height: 35.0, alignment: .leading)
                .padding(.horizontal, 20.0)
                .padding(.vertical, 5.0)
            Button {
                searchModel = SearchModel(text: text, collection: collection)
                self.inputCompletion?(searchModel)
            } label: {
                CustomText(text: "Search", size: 17.0)
                    .frame(height: 35.0, alignment: .center)
                    .shadow(color: .gray, radius: 7)
            }
        }.background(
            RoundedRectangle(cornerRadius: 7.0)
                .foregroundColor(Color.yellow)
        )
    }
}

struct MZoraSearchInputView_Previews: PreviewProvider {
    static var previews: some View {
        MZoraSearchInputView(searchModel: .constant(SearchModel()))
    }
}

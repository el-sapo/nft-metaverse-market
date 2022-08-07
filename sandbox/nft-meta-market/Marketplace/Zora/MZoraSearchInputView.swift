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
    var curated: Bool = false
}

struct MZoraSearchInputView: View {
    @Binding var searchModel: SearchModel

    @State var text: String = ""
    @State var curated: Bool
    
    var inputCollection = true
    var inputCompletion: ((SearchModel)->())?
    
    var body: some View {
        VStack {
            if inputCollection {
                Toggle("Curated Collections", isOn: $curated)
                    .shadow(color: .gray, radius: 4)
                    .toggleStyle(SwitchToggleStyle(tint: .purple))
                    .font(Font.customFont(size: 12.0, textStyle: .title2))
                    .frame(width: 150, alignment: .center)
                    .padding(.vertical, 10.0)
            }
            TextField("input title or desciption", text: $text)
                .multilineTextAlignment(.center)
                .font(Font.customFont(size: 17.0, textStyle: .title2))
                .frame(height: 35.0, alignment: .center)
                .padding(.horizontal, 20.0)
            Divider()
            Button {
                searchModel = SearchModel(text: text, collection: "", curated: curated)
                self.inputCompletion?(searchModel)
            } label: {
                if #available(iOS 15.0, *) {
                    CustomText(text: "Search 3D models", size: 17.0)
                        .frame(height: 35.0)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.purple)
                        .shadow(color: .gray, radius: 4)
                        .overlay {
                            RoundedRectangle(cornerRadius: 7.0).stroke(.purple, lineWidth: 2)
                        }
                } else {
                    CustomText(text: "Search 3D models", size: 17.0)
                        .frame(height: 35.0, alignment: .center)
                        .foregroundColor(.purple)
                        .shadow(color: .gray, radius: 7)
                }
            }
        }.background(Color.white)
    }
}

struct MZoraSearchInputView_Previews: PreviewProvider {
    static var previews: some View {
        MZoraSearchInputView(searchModel: .constant(SearchModel()), curated: false)
    }
}

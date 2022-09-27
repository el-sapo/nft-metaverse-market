//
//  MSelectorView.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import SwiftUI
import Combine

// Buttons for selecting active search mode
struct MSelectorView: View {
    let corners = 7.0
    @Binding var showMenu: MarketType
    @Binding var search: Bool

    var body: some View {
        HStack {
            Spacer()
                CustomText(text: "powered by", size: 12.0, textStyle: .body)
                    .frame(alignment: .bottom)
                    .foregroundColor(.purple)
                    .padding(EdgeInsets(top: 20.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
            Button {
                // action
                showMenu = .zora
                search.toggle()
            } label: {
                Image("zora")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, 5.0)
            }
            .background(Color.white)
            Spacer()
        }
    }
}

struct MSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MSelectorView(showMenu: .constant(.zora),
                      search: .constant(true))
    }
}

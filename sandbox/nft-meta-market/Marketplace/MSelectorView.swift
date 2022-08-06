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
            .frame(maxWidth: .infinity, alignment: .center)

            Spacer(minLength: 10.0)
            Button {
                // action
                showMenu = .nftup
            } label: {
                Image("nftstorage")
                    .resizable()
                    .scaledToFit()
            }
            .background(Color.red)
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct MSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MSelectorView(showMenu: .constant(.zora),
                      search: .constant(true))
    }
}

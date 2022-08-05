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
    @Binding var shouldSearch: Bool

    var body: some View {
        HStack {
            Button {
                // action
                showMenu = .zora
                shouldSearch = true
            } label: {
                Image("zora")
                    .resizable()
                    .scaledToFit()
            }
            .background(
                RoundedRectangle(cornerRadius: corners)
                    .foregroundColor(.white)
            )
            Spacer(minLength: 20.0)
            Button {
                // action
                showMenu = .nftup
            } label: {
                Image("nftstorage")
                    .resizable()
                    .scaledToFit()
            }
            .background(
                RoundedRectangle(cornerRadius: corners)
                    .foregroundColor(.red)
            )
        }
    }
}

struct MSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MSelectorView(showMenu: .constant(.zora),
                      shouldSearch: .constant(true))
    }
}

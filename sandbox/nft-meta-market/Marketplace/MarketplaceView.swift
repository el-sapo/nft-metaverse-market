//
//  MarketplaceView.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import SwiftUI

struct MarketplaceView: View {
    @State var showMenuType: MarketType = .zora
    @State var showSearch: Bool = true

    var body: some View {
        VStack {
            MSelectorView(showMenu: $showMenuType,
                          shouldSearch: $showSearch)
            if showMenuType == .zora {
                MZoraSearchView()
            }
            if showMenuType == .nftup {
                MNFTupSearchView()
            }
        }
        
    }
}

struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView()
    }
}

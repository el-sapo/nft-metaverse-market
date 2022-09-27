//
//  MarketplaceView.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import SwiftUI

struct MarketplaceView: View {
    @State var showMenuType: MarketType = .zora
    @State var search: Bool = true
    
    let viewModel = MarketplaceViewModel()
    
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack {
            MSelectorView(showMenu: $showMenuType,
                          search: $search)
              .frame(height: 50.0, alignment: .center)
              .onChange(of: search) { newValue in
                  search.toggle()
              }
            if showMenuType == .zora {
                MZoraSearchView(showInputSearch: $search)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            if showMenuType == .nftup {
                MNFTupSearchView()
            }
        }.frame(maxHeight: .infinity, alignment: .top)

        
    }
}

struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView()
    }
}

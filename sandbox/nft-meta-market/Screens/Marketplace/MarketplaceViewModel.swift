//
//  MarketplaceViewModel.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import Foundation

enum MarketType {
    case zora
    case nftup
    case none
}

class MarketplaceViewModel: ObservableObject {
    @Published var loading = false
    
    // open zora search by default
    @Published var showZoraSearch = true
    @Published var showNFTupSearch = false
    @Published var showSearch = false
    
    func searchModels(search: String? = nil) {
        
    }
}

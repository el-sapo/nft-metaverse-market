//
//  MZoraSearchView.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import SwiftUI

struct MZoraSearchView: View {
    @StateObject var viewModel: MZoraSearchViewModel = MZoraSearchViewModel()
    
    var body: some View {
        List(viewModel.searchItems) { item in
            
        }
    }
}

struct MZoraSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MZoraSearchView()
    }
}

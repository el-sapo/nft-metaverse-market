//
//  MZoraSearchView.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import SwiftUI

struct MZoraSearchView: View {
    @StateObject var viewModel: MZoraSearchViewModel = MZoraSearchViewModel()
    
    @State var searchModel: SearchModel = SearchModel()
    @State var applySearch: Bool = false

    @Binding var showInputSearch: Bool

    var body: some View {
        VStack {
            if showInputSearch {
                MZoraSearchInputView(searchModel: $searchModel, inputCompletion: { newSearch in
                    showInputSearch = false
                    viewModel.searchItems(text: newSearch.text ?? "", collectionAddress: newSearch.collection ?? "")
                })
                    .animation(.ripple(index: 0))
            }
            List(viewModel.searchItems) { searchItem in
                MZoraRowView(item: searchItem)
                    .onTapGesture {
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: NavigationName.game, object: nil, userInfo: ["model":searchItem.gameModel])
                        }
                    }
            }
        }.background(
            RoundedRectangle(cornerRadius: 7)
                .background(Color.white)
        )
    }
}

struct MZoraSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MZoraSearchView(showInputSearch: .constant(true))
    }
}

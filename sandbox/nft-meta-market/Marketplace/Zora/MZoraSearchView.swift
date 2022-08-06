//
//  MZoraSearchView.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import SwiftUI
import SwiftfulLoadingIndicators

struct MZoraSearchView: View {
    @StateObject var viewModel: MZoraSearchViewModel = MZoraSearchViewModel()
    
    @State var searchModel: SearchModel = SearchModel()
    @State var applySearch: Bool = false

    @Binding var showInputSearch: Bool

    var body: some View {
        VStack(spacing: 0) {
            Divider()
            if showInputSearch {
                MZoraSearchInputView(searchModel: $searchModel, inputCompletion: { newSearch in
                    showInputSearch = false
                    viewModel.searchItems(text: newSearch.text ?? "", collectionAddress: newSearch.collection ?? "")
                })
                .padding(.horizontal, 30.0)
                .padding(.vertical, 10.0)
                .animation(.ripple(index: 0))
            }
            if viewModel.loading {
                Spacer()
                LoadingIndicator(animation: .heart, color: .purple, size: .small, speed: .normal)
                LoadingIndicator(animation: .text, color: .purple, size: .large, speed: .fast)
                Spacer()
            }
            List(viewModel.searchItems) { searchItem in
                MZoraRowView(item: searchItem)
                    .onTapGesture {
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: NavigationName.game, object: nil, userInfo: ["model":searchItem.gameModel])
                        }
                    }
            }
        }
    }
}

struct MZoraSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MZoraSearchView(showInputSearch: .constant(true))
    }
}

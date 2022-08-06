//
//  MZoraSearchViewModel.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 5/8/22.
//

import Foundation
import Combine

class MZoraSearchViewModel: ObservableObject {
    @Published var searchItems: [ZoraModel] = []

    var observers: [AnyCancellable] = []

    func searchItems(text: String = "", collectionAddress: String = "") {
        DataManager.shared.fetchSearchZoraModels(search: text, collection: collectionAddress)
            .sink { result in
                switch result {
                case .finished:
                    debugPrint("finished")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] searchResults in
                self?.searchItems = searchResults
            }.store(in: &observers)
    }
}

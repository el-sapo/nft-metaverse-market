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
    @Published var loading: Bool = false
    @Published var errorMessage: String? = nil
    
    var observers: [AnyCancellable] = []

    init() {
        NotificationCenter.default.addObserver(forName: NavigationName.game, object: nil, queue: nil) { [weak self] notification in
            self?.searchItems = []
            self?.loading = true
        }
    }
    
    func searchItems(text: String = "", curated: Bool = false) {
        searchItems = []
        loading = true
        errorMessage = nil
        DataManager.shared.fetchSearchZoraModels(search: text, curated: curated)
            .sink { [weak self] result in
                switch result {
                case .finished:
                    debugPrint("finished")
                case .failure(let error):
                    print(error)
                    self?.loading = false
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] searchResults in
                self?.searchItems = searchResults
                self?.loading = false
            }.store(in: &observers)
    }
}

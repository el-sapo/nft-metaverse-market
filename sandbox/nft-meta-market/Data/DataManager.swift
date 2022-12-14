//
//  DataManager.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import Foundation
import Combine

class DataManager: ObservableObject {
    // create shared instance
    static let shared = DataManager()
    
    @Published var gameModel: GameModel? = nil
    
    let curatedCollection = "fede3.eth"
    
    init() {
        NotificationCenter.default.addObserver(forName: NavigationName.game, object: nil, queue: nil) { [weak self] notification in
            self?.gameModel = notification.userInfo?["model"] as? GameModel
        }
    }
    
    // set list of observers to handle responses from Network class
    var observers: [AnyCancellable] = []
    
    func fetchSearchZoraModels(search: String, curated: Bool = false) -> Future<[ZoraModel], Error> {
        if curated {
           return searchCuratedZoraModels(search: search)
        } else {
            return searchZoraModels(search: search)
        }
    }
    
    private func searchZoraModels(search: String) -> Future<[ZoraModel], Error> {
        return Future { [weak self] promise in
            guard let self = self else { return }
            let _ = ZONetwork.shared.getZoraSearch(searchText: search)
                .sink(receiveCompletion: { result in
                       switch result {
                       case .finished:
                            debugPrint("finished")
                       case .failure(let error):
                           print(error)
                       }
                   }, receiveValue: { metadataList in
                       promise(.success(metadataList))
                   })
                .store(in: &self.observers)
        }
    }
    
    private func searchCuratedZoraModels(search: String) -> Future<[ZoraModel], Error> {
        return Future { [weak self] promise in
            guard let self = self else { return }
            let _ = ZONetwork.shared.getZoraCollectionSearch(searchText: search, collection: self.curatedCollection)
                .sink(receiveCompletion: { result in
                       switch result {
                       case .finished:
                            debugPrint("finished")
                       case .failure(let error):
                           print(error)
                       }
                   }, receiveValue: { metadataList in
                       promise(.success(metadataList))
                   })
                .store(in: &self.observers)
        }
    }
}

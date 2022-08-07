//
//  ZONetwork.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import Foundation
import Apollo
import Combine

public class ZONetwork {
    // create shared instance
    static let shared = ZONetwork()

    private let zo_api = "https://api.zora.co/graphql"
    private(set) lazy var apollo = ApolloClient(url: URL(string: zo_api)!)
    
    func getZoraSearch(searchText: String) -> Future<[ZoraModel], Error> {
        return Future { [weak self] promise in
            guard let self = self else { return }
            print("searching text: \(searchText)")
            self.apollo.fetch(query: SearchGlbModelsQuery(search: searchText)) { result in
                switch result {
                  case .success(let graphQLResult):
                    if let nodes = graphQLResult.data?.search.nodes {
                        var resultModels: [ZoraModel] = []
                        var i: Int = 0
                        for token in nodes {
                            if let asToken = token.entity?.asToken {
                                // JSON deserializer crashes with some contents in metadata, so we have to do it manually
                                switch asToken.metadata {
                                    case .dictionary(let metadata):
                                    let model = ZoraModel(id: i,
                                                          items: metadata,
                                                          collection: asToken.collectionName,
                                                          collectionAddress: asToken.collectionAddress,
                                                          tokenId: asToken.tokenId)
                                        resultModels.append(model)
                                        i+=1
                                    case .array(_):
                                        debugPrint("metadata should be dictionary")
                                    case .none:
                                        debugPrint("metadata is empty")
                                }
                            }
                        }
                        promise(.success(resultModels))
                    } else if let errors = graphQLResult.errors {
                        // GraphQL errors
                        print(errors)
                        let error = NSError(domain: "", code: 200, userInfo: nil)
                        promise(.failure(error))
                    }
                  case .failure(let error):
                    // Network or response format errors
                    print(error)
                    promise(.failure(error))
                  }
            }
        }
    }
    
    func getZoraCollectionSearch(searchText: String, collection: String) -> Future<[ZoraModel], Error> {
        return Future { [weak self] promise in
            guard let self = self else { return }
            print("searching curated text: \(searchText), collection: \(collection)")
            self.apollo.fetch(query: SearchGlbCollectionModelsQuery(search: searchText, collectionAddress: collection)) { result in
                switch result {
                  case .success(let graphQLResult):
                    if let nodes = graphQLResult.data?.search.nodes {
                        var resultModels: [ZoraModel] = []
                        var i: Int = 0
                        for token in nodes {
                            if let asToken = token.entity?.asToken {
                                // JSON deserializer crashes with some contents in metadata, so we have to do it manually
                                switch asToken.metadata {
                                    case .dictionary(let metadata):
                                    let model = ZoraModel(id: i,
                                                          items: metadata,
                                                          collection: asToken.collectionName,
                                                          collectionAddress: asToken.collectionAddress,
                                                          tokenId: asToken.tokenId)
                                        resultModels.append(model)
                                        i+=1
                                    case .array(_):
                                        debugPrint("metadata should be dictionary")
                                    case .none:
                                        debugPrint("metadata is empty")
                                }
                            }
                        }
                        promise(.success(resultModels))
                    } else if let errors = graphQLResult.errors {
                        // GraphQL errors
                        print(errors)
                        let error = NSError(domain: "", code: 200, userInfo: nil)
                        promise(.failure(error))
                    }
                  case .failure(let error):
                    // Network or response format errors
                    print(error)
                    promise(.failure(error))
                  }
            }
        }
    }

    func getMockZoraSearch(searchText: String, collectionAddress: String = "") -> Future<[ZoraModel], Error> {
        return Future { [weak self] promise in
            guard let self = self else { return }
            print("searching mock text: \(searchText) collection: \(collectionAddress)")
            self.apollo.fetch(query: MockSearchGlbModelsQuery()) { result in
                switch result {
                  case .success(let graphQLResult):
                    if let nodes = graphQLResult.data?.search.nodes {
                        var resultModels: [ZoraModel] = [];
                        var i: Int = 0
                        for token in nodes {
                            if let asToken = token.entity?.asToken {
                                // JSON deserializer crashes with some contents in metadata, so we have to do it manually
                                switch asToken.metadata {
                                    case .dictionary(let metadata):
                                    let model = ZoraModel(id: i,
                                                          items: metadata,
                                                          collection: asToken.collectionName,
                                                          collectionAddress: asToken.collectionAddress,
                                                          tokenId: asToken.tokenId)
                                        resultModels.append(model)
                                        i+=1
                                    case .array(_):
                                        debugPrint("metadata should be dictionary")
                                    case .none:
                                        debugPrint("metadata is empty")
                                }
                            }
                        }
                        promise(.success(resultModels))
                    } else if let errors = graphQLResult.errors {
                        // GraphQL errors
                        print(errors)
                        let error = NSError(domain: "", code: 200, userInfo: nil)
                        promise(.failure(error))
                    }
                  case .failure(let error):
                    // Network or response format errors
                    print(error)
                    promise(.failure(error))
                  }
            }
        }
    }
}

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
}

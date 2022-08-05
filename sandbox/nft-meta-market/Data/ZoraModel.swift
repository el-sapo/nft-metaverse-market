//
//  ZoraModel.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import Foundation

struct ZoraModel: Identifiable {
    let id: Int
    let title: String = ""
    let description: String = ""
    let imageUrl: String = ""
    let gameModel: GameModel? = nil
}

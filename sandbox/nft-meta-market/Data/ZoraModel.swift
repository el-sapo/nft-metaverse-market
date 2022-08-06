//
//  ZoraModel.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import Foundation

struct ZoraModel: Identifiable {
    let id: Int
    let title: String
    let description: String?
    let collectionName: String?
    let imageUrl: String?
    let gameModel: GameModel?
}

extension ZoraModel {
    init(id: Int, title: String = "", description: String = "", collectionName: String = "", imageUrl: String = "", gameModelUrl: String) {
        self.id = id
        self.title = title
        self.description = description
        self.collectionName = collectionName
        self.imageUrl = imageUrl
        self.gameModel = GameModel(glbUrl: gameModelUrl)
    }
    
    // Metadata for 3D models is not standarized so this could change.
    // This metadata structure follows Manifold contracts for 3D models
    init(id: Int, items: [String: Any], collection: String?) {
        var title = ""
        var desc = ""
        var image = ""
        var gameUrl = ""
        for item in items {
            if item.key == "name" {
                title = item.value as? String ?? ""
            } else if item.key == "description" {
                desc = item.value as? String ?? ""
            } else if item.key == "image" {
                image = item.value as? String ?? ""
            } else if item.key == "animation_url" {
                gameUrl = item.value as? String ?? ""
            }
        }
        self.id = id
        self.title = title
        self.description = desc
        self.imageUrl = image
        self.collectionName = collection ?? ""
        self.gameModel = GameModel(glbUrl: gameUrl)
    }
}

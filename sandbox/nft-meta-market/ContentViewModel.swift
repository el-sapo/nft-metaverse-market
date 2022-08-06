//
//  ContentViewModel.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 6/8/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var gameModel: GameModel? = nil
    @Published var hideMenu: Bool = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init() {
        NotificationCenter.default.addObserver(forName: NavigationName.game, object: nil, queue: nil) { [weak self] notification in
            self?.gameModel = notification.userInfo?["model"] as? GameModel
            self?.hideMenu = false
        }
        NotificationCenter.default.addObserver(forName: NavigationName.marketplace, object: nil, queue: nil) { [weak self] notification in
            self?.hideMenu = true
        }
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(startMenu), userInfo: nil, repeats: false)

    }
    @objc func startMenu() {
        hideMenu = false
    }
}

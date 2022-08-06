//
//  ViewCoordinator.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import Foundation
import UIKit
import SwiftUI

struct NavigationName {
    static let marketplace = NSNotification.Name(rawValue: "Market")
    static let game = NSNotification.Name(rawValue: "Game")
    static let purchase = NSNotification.Name(rawValue: "Purchase")
    static let none = NSNotification.Name(rawValue: "None")
}

class ViewCoordinator {
    let rootVC: UIViewController
    var unityVC: UIViewController?
    var gameVC: GameViewController?
    var marketplaceVC: UIViewController?
    var menuView: GameMenuView?
    
    private let notificationCenter = NotificationCenter.default

    init(viewController: UIViewController) {
        rootVC = viewController
        handleNavigationActions()
    }
    
    func handleNavigationActions() {
        notificationCenter.addObserver(forName: NavigationName.game, object: nil, queue: nil) { [weak self] notification in
            guard let model = notification.userInfo?["model"] as? GameModel else { return }
            DispatchQueue.main.async {
                self?.marketplaceVC?.dismiss(animated: true)
                self?.showGameModel(model: model)
            }
        }
        notificationCenter.addObserver(forName: NavigationName.marketplace, object: nil, queue: nil) { [weak self] notification in
            self?.showMarketplaceVC()
        }
        notificationCenter.addObserver(forName: NavigationName.purchase, object: nil, queue: nil) { [weak self] notification in
            guard let model = notification.userInfo?["model"] as? GameModel, let storeUrl = model.storeUrl else { return }
            DispatchQueue.main.async {
                if let url = URL(string: storeUrl) {
                    UIApplication.shared.open(url)
                }
            }
        }
    }
                                       
    
    func showGameModel(model: GameModel?) {

        // if another model loaded, remove VC and reload
        if let gameVC = gameVC {
            gameVC.willMove(toParent: nil)
            gameVC.view.removeFromSuperview()
            gameVC.removeFromParent()
        }
            
        if let gameViewController = UIStoryboard(name: "Game", bundle: Bundle.main)
            .instantiateViewController(identifier: "GameViewController") as? GameViewController, let gameModel = model
        {
//                gameViewController.modelUrl = model.glbUrl
            rootVC.addChild(gameViewController)
            gameViewController.view.frame = rootVC.view.frame
            // Add the child’s view to main view, along with any Auto Layout constraints.
            rootVC.view.addSubview(gameViewController.view)
            gameViewController.didMove(toParent: rootVC)
            gameViewController.setupScene(gameModel: gameModel)
            gameVC = gameViewController
        } else {
            print("Wrong initialization gameViewController")
        }
    }
        
    func showMarketplaceVC() {
        // hide GameVC or then update url?
        let marketplaceVC = UIHostingController(rootView: MarketplaceView())
        rootVC.present(marketplaceVC, animated: true) {
            
        }
        self.marketplaceVC = marketplaceVC
    }
}

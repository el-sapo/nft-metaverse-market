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
    static let none = NSNotification.Name(rawValue: "None")
}

class ViewCoordinator {
    let rootVC: UIViewController
    var unityVC: UIViewController?
    var gameVC: GameViewController?
    var marketplaceVC: UIViewController?
    
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
    }
                                       
    
    func showGameModel(model: GameModel) {

        /* if I need to remove
         viewContoller.willMove(toParent: nil)
                     viewContoller.view.removeFromSuperview()
                     viewContoller.removeFromParent()
        */
        
        // show selected model!!!!
        if let gameVC = gameVC {
            gameVC.modelUrl = model.glbUrl
            gameVC.setupScene()
        } else {
            if let gameViewController = UIStoryboard(name: "Game", bundle: Bundle.main)
                .instantiateViewController(identifier: "GameViewController") as? GameViewController
            {
                gameViewController.modelUrl = model.glbUrl
                rootVC.addChild(gameViewController)
                gameViewController.view.frame = rootVC.view.frame
                // Add the child’s view to main view, along with any Auto Layout constraints.
                rootVC.view.addSubview(gameViewController.view)
                gameViewController.didMove(toParent: rootVC)
                gameViewController.setupScene()
                gameVC = gameViewController
            } else {
                print("Wrong initialization gameViewController")
            }
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

//
//  DataManager.swift
//  nft-meta-market
//
//  Created by Federico Lagarmilla on 4/8/22.
//

import Foundation
import Combine

class DataManager {
    // create shared instance
    static let shared = DataManager()

    // set list of observers to handle responses from Network class
    var observers: [AnyCancellable] = []
}

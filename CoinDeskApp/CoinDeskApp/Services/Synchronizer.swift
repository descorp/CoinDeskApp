//
//  Syncronizer.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

protocol HasSynchronizer {
    var synchronizer: Synchronizer { get }
}

/// Triggers on Syncronizer tick
protocol SynchronizerDelegate {
    func onTick()
}

protocol Synchronizer {
    
    /// Initiate syncronizer
    ///
    /// - Parameter interval: interval of syncronisation.
    func start(interval: TimeInterval)
    
    /// Stop syncronizer
    func stop()
    
    /// Delegate to trigger syncronisation
    var delegate: SynchronizerDelegate { get set }
}

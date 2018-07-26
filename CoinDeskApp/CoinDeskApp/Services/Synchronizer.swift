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
protocol SynchronizerDelegate: class {
    func onTick()
}

protocol Synchronizer: class {
    
    /// Initiate syncronizer
    ///
    /// - Parameter interval: interval of syncronisation.
    func start(interval: TimeInterval)
    
    /// Stop syncronizer
    func stop()
    
    /// Delegate to trigger syncronisation
    var delegate: SynchronizerDelegate? { get set }
}

class SyncService: Synchronizer {
    
    func start(interval: TimeInterval) {
        
    }
    
    func stop() {
        
    }
    
    public weak var  delegate: SynchronizerDelegate?
}

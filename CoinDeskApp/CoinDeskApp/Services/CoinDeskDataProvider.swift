//
//  CoinDeskDataProvider.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import Common

protocol HasIndexDataProvider {
    var indexDataProvider: IndexDataProvider { get }
}

public enum Result<T: Codable> {
    case data(result: T, timestamp: Date)
    case noData
    case error(URLError)
}

protocol IndexDataProvider {
    var timeInterval : TimeInterval { get set }
    func getIndex(_: (Result<PriceIndex>) -> Void)
    func getIndexHistory(_: (Result<PriceIndexHistoryRecord>) -> Void)
    func getCurrencies(_: (Result<[String]>) -> Void)
    func cleanCache()
}

class CoinDeskService: IndexDataProvider {
    
    let synchronizer : Synchronizer
    let cache: CacheStorage
    public var timeInterval: TimeInterval = 5
    
    init(synchronizer : Synchronizer, cache: CacheStorage) {
        self.synchronizer = synchronizer
        self.cache = cache
    }

    public func cleanCache() {
        
    }
    
    func getIndex(_: (Result<PriceIndex>) -> Void) {
        
    }
    
    func getIndexHistory(_: (Result<PriceIndexHistoryRecord>) -> Void) {
        
    }
    
    func getCurrencies(_: (Result<[String]>) -> Void) {
        
    }
}

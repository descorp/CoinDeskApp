//
//  CoinDeskDataProvider.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import CoinDeskProvider
import Common

protocol HasIndexDataProvider {
    var indexDataProvider: IndexDataProvider { get }
}

public enum Result<T: Codable> {
    case data(result: T?, timestamp: Date?)
    case error(URLError)
}

protocol IndexDataProvider {
    var timeInterval : TimeInterval { get set }
    func getIndex(currency: String?, _: @escaping (Result<[PriceIndex]>) -> Void)
    func getIndexHistory(from: Date, to: Date, currency: String?, _ : @escaping (Result<[PriceIndexHistoryRecord]>) -> Void)
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
    
    func getIndex(currency: String?, _ callback: @escaping (Result<[PriceIndex]>) -> Void) {
        API.getBpi(currency: currency).request { (responce: Response<PriceIndex>) in
            switch responce {
            case .success(let result):
                callback(.data(result: result.bpi, timestamp: Date()))
            case .failure(let error):
                callback(.error(error as! URLError))
            }
        }
    }
    
    func getIndexHistory(from: Date, to: Date, currency: String?, _ callback: @escaping (Result<[PriceIndexHistoryRecord]>) -> Void) {
        API.getHistory(from: from, to: to, currency: currency).request { (responce: Response<PriceIndexHistoryRecord>) in
            switch responce {
            case .success(let result):
                callback(.data(result: result.bpi, timestamp: Date()))
            case .failure(let error):
                callback(.error(error as! URLError))
            }
        }
    }
    
    func getCurrencies(_ callback: (Result<[String]>) -> Void) {
        //callback()
    }
}

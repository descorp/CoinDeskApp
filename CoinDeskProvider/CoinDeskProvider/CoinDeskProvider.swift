//
//  CoinDeskProvider.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

public enum Response<T> {
    case success(result: T)
    case failure(Error)
}

public class CoinDeskProvider {
    
    public static func getCurrentBpi(callback: @escaping (Response<BpiResponse>) -> Void) {
        API.getBpi(currency: nil).request(callback: callback)
    }
    
    public static func getCurrentBpi(currency: String, callback: @escaping (Response<BpiResponse>) -> Void) {
        API.getBpi(currency: currency).request(callback: callback)
    }
    
    public static func getHistoricalBpi(from: Date, to: Date, currency: String, callback: @escaping (Response<BpiHistoryResponse>) -> Void) {
        API.getHistory(from: from, to: to, currency: currency).request(callback: callback)
    }
    
    public static func getHistoricalBpi(from: Date, to: Date, callback: @escaping (Response<BpiHistoryResponse>) -> Void) {
        API.getHistory(from: from, to: to, currency: nil).request(callback: callback)
    }
}

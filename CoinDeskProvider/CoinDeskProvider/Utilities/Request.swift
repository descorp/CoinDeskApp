//
//  Request.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

public enum CoilDeskProviderError : Error {
    case notCorrectResponce
}

enum API {
    
    private static let coinDeskUrl = URL(string:"https://api.coindesk.com/v1/bpi")!
    
    case getBpi(currency: String?)
    case getHistory(from: Date, to: Date, currency: String?)
    
    func request<T>(callback: @escaping (Response<T>) -> Void) {
        let url = API.coinDeskUrl.appendingPathComponent(self.path)
        URLSession.shared.dataTask(with: url, completionHandler: { (data, responce, error) in
            if let error = error {
                callback(.failure(error))
                return
            }
            
            guard
                let data = data
            else {
                callback(.failure(CoilDeskProviderError.notCorrectResponce))
                return
            }
            
            let result: Response<T> = self.parser.parse(data: data)
            callback(result)
        })
    }
    
    var path: String {
        switch self {
        case .getBpi(nil):
            return "currentprice"
        case let .getBpi(currency):
            return "currentprice/\(currency!)"
        case let .getHistory(from, to, nil):
            return "historical/close.json?start=\(from.isoDateString)&end=\(to.isoDateString)"
        case let .getHistory(from, to, currency):
            return "historical/close.json?start=\(from.isoDateString)&end=\(to.isoDateString)&currency=\(currency!)"
        }
    }
    
    var parser: Parser {
        switch self {
        case .getBpi:
            return BpiParser()
        case .getHistory:
            return BpiHistoryParser()
        }
    }
}

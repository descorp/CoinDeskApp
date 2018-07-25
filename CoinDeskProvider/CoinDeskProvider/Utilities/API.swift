//
//  Request.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

public enum CoilDeskProviderError : Error {
    case incorrectResponce
    case parsingError
    case incorrectData
    
    var localizedDescription: String {
        switch self {
        case .incorrectResponce:
            return "Incorrect responce"
        case .parsingError:
            return "Not able to parse"
        case .incorrectData:
            return "Incorrect data in responce"
        }
    }
}

enum API {
    
    private static let sessionSecurity = SecureURLSession()
    private static let session = URLSession(configuration: URLSessionConfiguration.default,
                                            delegate: sessionSecurity,
                                            delegateQueue: nil)
    private static let coinDeskUrl = URL(string:"https://api.coindesk.com/v1/bpi")!
    
    case getBpi(currency: String?)
    case getHistory(from: Date, to: Date, currency: String?)
    
    func request<T: Codable>(callback: @escaping (Response<T>) -> Void) {
        let url = API.coinDeskUrl.appendingPathComponent(self.path)
        API.session.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                callback(.failure(error))
                return
            }
            
            guard
                let data = data
            else {
                callback(.failure(CoilDeskProviderError.incorrectResponce))
                return
            }
            
            let result: Response<T> = self.parse(data: data)
            callback(result)
        }.resume()
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
    
    private func parse<T>(data: Data) -> Response<T> {
        switch self {
        case .getBpi:
            return BpiParser().parse(data: data) as! Response<T>
        case .getHistory:
            return BpiHistoryParser().parse(data: data) as! Response<T>
        }
    }
}

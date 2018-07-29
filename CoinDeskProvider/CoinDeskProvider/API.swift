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

public enum API {
    
    private static let sessionSecurity = SecureURLSession()
    private static let session = URLSession(configuration: URLSessionConfiguration.default,
                                            delegate: sessionSecurity,
                                            delegateQueue: nil)
    private static let coinDeskUrl = URL(string:"https://api.coindesk.com/v1/bpi")!
    
    case getBpi(currency: String?)
    case getHistory(from: Date, to: Date, currency: String?)
    
    public func request<T: Codable>(callback: @escaping (Response<T>) -> Void) {
        let url = self.path
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
    
    var path: URL {
        switch self {
        case .getBpi(nil):
            return API.coinDeskUrl.appendingPathComponent("currentprice")
        case let .getBpi(currency):
            return API.coinDeskUrl.appendingPathComponent("currentprice/\(currency!)")
        case let .getHistory(from, to, currency):
            var components = URLComponents(string: API.coinDeskUrl.appendingPathComponent("historical/close.json").absoluteString)
            components?.queryItems = [URLQueryItem(name: "start", value: from.isoDateString),
                                      URLQueryItem(name: "end", value: to.isoDateString),
                                      URLQueryItem(name: "currency", value: currency)]
            
            return components!.url!
        }
    }
    
    private func parse<T>(data: Data) -> Response<T> {
        switch self {
        case .getBpi:
            return BpiParser().parse(data: data) as! Response<T>
        case let .getHistory(_,_,code):
            return BpiHistoryParser(currency: code).parse(data: data) as! Response<T>
        }
    }
}

//
//  BpiParser.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

class BpiParser {    
    func parse(data: Data) -> Response<BitcoinPriceIndex> {
        guard
            let raw = try? JSONDecoder().decode(BipServerResponse.self, from: data)
        else {
            return .failure(CoilDeskProviderError.parsingError)
        }
        
        guard
            let timestamp = Date(isoString: raw.time.updatedISO)
        else {
            return .failure(CoilDeskProviderError.incorrectData)
        }
        
        let collection = raw.bpi.values.map({ (item) -> BitcoinPriceIndex in
            let value = Decimal(string: item.rate.replacingOccurrences(of: ",", with: ""))!
            return BitcoinPriceIndex(code: item.code, rate: value)
        })
        let result = BpiResponse(timestamp: timestamp, bpi: collection)
        
        return .success(result: result)
    }
}

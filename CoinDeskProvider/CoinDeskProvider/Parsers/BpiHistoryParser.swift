//
//  BpiHistoryParser.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

class BpiHistoryParser {
    
    func parse(data: Data) -> Response<BitcoinPriceIndexHistoryRecord> {
        guard
            let raw = try? JSONDecoder().decode(BPIHistoryServerResponse.self, from: data)
            else {
                return .failure(CoilDeskProviderError.parsingError)
        }
        
        guard
            let timestamp = Date(isoString: raw.time.updatedISO)
            else {
                return .failure(CoilDeskProviderError.incorrectData)
        }
        
        let collection = raw.bpi.map({ (key, item) -> BitcoinPriceIndexHistoryRecord in
            let value = Decimal(10000*item) / 10000
            return BitcoinPriceIndexHistoryRecord(date: Date(dateString: key)!, value: value)
        })
        let result = BpiResponse(timestamp: timestamp, bpi: collection)
        return .success(result: result)
    }
}

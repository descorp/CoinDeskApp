//
//  BpiHistoryParser.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import Common

class BpiHistoryParser {
    
    let currency: String
    
    init(currency: String?) {
        if let code = currency {
            self.currency = code.lowercased()
        } else {
            self.currency = "usd"
        }
    }
    
    func parse(data: Data) -> Response<PriceIndexHistoryRecord> {
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
        
        let collection = raw.bpi.map({ (key, item) -> PriceIndexHistoryRecord in
            let value = Decimal(10000*item) / 10000
            return PriceIndexHistoryRecord(date: Date(dateString: key)!, value: value, code: currency)
        })
        let result = BpiResponse(timestamp: timestamp, bpi: collection)
        return .success(result: result)
    }
}

extension PriceIndexHistoryRecord {
    init(date: Date, value: Decimal, code: String) {
        self.date = date
        self.value = PriceIndex(code: code, rate: value)
    }
}

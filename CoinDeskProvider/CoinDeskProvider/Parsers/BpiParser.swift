//
//  BpiParser.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import Common

class BpiParser {    
    func parse(data: Data) -> Response<PriceIndex> {
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
        
        let collection = raw.bpi.values.map({ (item) -> PriceIndex in
            let value = Decimal(string: item.rate.replacingOccurrences(of: ",", with: ""))!
            return PriceIndex(code: item.code, rate: value)
        })
        let result = BpiResponse(timestamp: timestamp, bpi: collection)
        
        return .success(result: result)
    }
}

extension PriceIndex {
    init(code: String, rate: Decimal) {
        self.code = code
        self.rate = rate
    }
}

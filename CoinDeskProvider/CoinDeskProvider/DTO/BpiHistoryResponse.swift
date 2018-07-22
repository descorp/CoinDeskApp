//
//  BpiHistoryResponse.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

public struct BpiHistoryResponse : Codable {
    let timestamp: Date
    let records: [BitcoinPriceIndexHistoryRecord]
}

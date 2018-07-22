//
//  BitcoinPriceIndex.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

struct BPIHistoryServerResponse : Codable {
    let bpi : [String: Double]
	let disclaimer : String?
	let time : Time
}

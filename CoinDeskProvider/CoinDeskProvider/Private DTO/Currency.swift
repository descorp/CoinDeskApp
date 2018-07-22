//
//  BitcoinPriceIndex.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

struct Currency : Codable {
	let code : String
	let rate : String
	let description : String
	let rate_float : Double
}

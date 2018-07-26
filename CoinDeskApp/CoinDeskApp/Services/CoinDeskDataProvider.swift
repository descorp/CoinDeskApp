//
//  CoinDeskDataProvider.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 26/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import CoinDeskProvider

protocol HasCoinDeskDataProvider {
    var dataProvider: CoinDeskDataProvider { get }
}

protocol CoinDeskDataProvider {
    func getIndex() -> Response<BitcoinPriceIndex>
    func getIndexHistory() -> Response<BitcoinPriceIndexHistoryRecord>
}

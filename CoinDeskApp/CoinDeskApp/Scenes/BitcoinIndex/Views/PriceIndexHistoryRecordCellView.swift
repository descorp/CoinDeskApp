//
//  PriceIndexHistoryRecordCellView.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 29/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation
import Common
import UIKit

class PriceIndexHistoryRecordCellView: UITableViewCell {
    
    func updateWith(date: Date, value: PriceIndex) {
        self.textLabel?.text = date.dateString
        self.detailTextLabel?.text = value.rate.description
    }
    
}

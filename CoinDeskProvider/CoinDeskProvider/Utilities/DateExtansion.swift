//
//  DateExtansion.swift
//  CoinDeskProvider
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

extension Date {
    
    private var gregorian: Calendar {
        return Calendar(identifier: .gregorian)
    }
    
    var isoDateString: String {
        let date = gregorian.dateComponents([.year, .month, .day], from: self)
        return "\(date.year!)-\(date.month!)-\(date.day!)"
    }
}

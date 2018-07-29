//
//  DateExtensions.swift
//  CoinDeskApp
//
//  Created by Vladimir Abramichev on 29/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

extension Date {
    
    var dateString : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        return formatter.string(from: self)
    }
    
    func dateAgo(week: Int) -> Date {
        return Calendar.current.date(byAdding: Calendar.Component.day , value: 7 * week, to: self)!
    }
    
}

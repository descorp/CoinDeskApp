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
        return "\(String(format: "%04d", date.year!))-\(String(format: "%02d", date.month!))-\(String(format: "%02d", date.day!))"
    }
    
    init?(isoString string:String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        if let date = formatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }
    
    init?(dateString string:String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        if let date = formatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }
}

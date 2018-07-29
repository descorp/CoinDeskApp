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
        
        return formatter.string(from: self)
    }
    
}

//
//  DateExtensionTests.swift
//  CoinDeskProviderTests
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

import XCTest
@testable import CoinDeskProvider

class DateExtensionTests: XCTestCase {
    
    func testsDatoToString() {
        
        let date1 = Date(timeIntervalSince1970: 1532284559) // Sun, 22 Jul 2018 18:35:59 +0000
        XCTAssertEqual(date1.isoDateString, "2018-07-22")
        
        let date2 = Date(timeIntervalSince1970: 1367193600) // Mon, 29 Apr 2013 00:00:00 +0000
        XCTAssertEqual(date2.isoDateString, "2013-04-29")
    }
    
    func testsDateInitiatedFromIsoString() {
        XCTAssertEqual(Date(isoString: "2017-09-06T00:03:00+00:00")!.description, "2017-09-06 00:03:00 +0000")
    }
}

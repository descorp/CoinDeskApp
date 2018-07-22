//
//  CoinDeskProviderTests.swift
//  CoinDeskProviderTests
//
//  Created by Vladimir Abramichev on 22/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import XCTest
@testable import CoinDeskProvider

class ParsersTests: XCTestCase {
    
    func testBpiParserCanParse() {
        let path = Bundle(for: type(of: self)).path(forResource: "bpi", ofType: ".json")
        let data = FileManager.default.contents(atPath: path!)!
        
        let result: Response<BitcoinPriceIndex> = BpiParser().parse(data: data)
        
        XCTAssertNotNil(result)
        
        switch result {
        case .success(let object):
            XCTAssertNotNil(object)
            XCTAssertEqual(object.timestamp.description, "2018-07-22 16:14:00 +0000")
            XCTAssertNotNil(object.bpi)
            XCTAssertTrue(object.bpi.count > 0)
            XCTAssertEqual(object.bpi[0].code, "USD")
            XCTAssertEqual(object.bpi[0].rate.description, "7510.5863")
        case .failure(let error):
            XCTFail("Error: \(error)")
        }
    }
    
    func testBpiHistoryParserCanParse() {
        let path = Bundle(for: type(of: self)).path(forResource: "bpi_history", ofType: ".json")
        let data = FileManager.default.contents(atPath: path!)!
        
        let result: Response<BitcoinPriceIndexHistoryRecord> = BpiHistoryParser().parse(data: data)
        
        XCTAssertNotNil(result)
        
        switch result {
        case .success(let object):
            XCTAssertNotNil(object)
            XCTAssertEqual(object.timestamp.description, "2017-09-06 00:03:00 +0000")
            XCTAssertNotNil(object.bpi)
            XCTAssertTrue(object.bpi.count > 0)
            XCTAssertEqual(object.bpi[0].date.description, "2017-09-01 00:00:00 +0000")
            XCTAssertEqual(object.bpi[0].value.description, "4173.6334")
        case .failure(let error):
            XCTFail("Error: \(error)")
        }
    }
    
    func testBpiHistoryParserThrowErrorOnInvalidJson() {
        let path = Bundle(for: type(of: self)).path(forResource: "invalid", ofType: ".json")
        let data = FileManager.default.contents(atPath: path!)!
        
        let result: Response<BitcoinPriceIndexHistoryRecord> = BpiHistoryParser().parse(data: data)
        
        XCTAssertNotNil(result)
        
        switch result {
        case .success:
            XCTFail("Error: Should throw the error")
        case .failure(let error):
            if case CoilDeskProviderError.parsingError = error {
                 XCTAssert(true)
            } else {
                XCTFail("Wrong error")
            }
        }
    }
    
    func testBpiParserThrowErrorOnInvalidJson() {
        let path = Bundle(for: type(of: self)).path(forResource: "invalid", ofType: ".json")
        let data = FileManager.default.contents(atPath: path!)!
        
        let result: Response<BitcoinPriceIndex> = BpiParser().parse(data: data)
        
        XCTAssertNotNil(result)
        
        switch result {
        case .success:
            XCTFail("Error: Should throw the error")
        case .failure(let error):
            if case CoilDeskProviderError.parsingError = error {
                XCTAssert(true)
            } else {
                XCTFail("Wrong error")
            }
        }
    }
}

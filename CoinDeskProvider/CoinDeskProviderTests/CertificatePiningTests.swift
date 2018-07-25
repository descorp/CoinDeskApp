//
//  CertificatePiningTests.swift
//  CoinDeskProviderTests
//
//  Created by Vladimir Abramichev on 25/07/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import Foundation

import XCTest
@testable import CoinDeskProvider

class CertificatePiningTests: XCTestCase {
    
    func testsSecuritySessionDeniesUnsecuredUrl() {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: SecureURLSession(), delegateQueue: nil)
        let unsecureUrl = URL(string: "https://www.google.com")!
        
        let expectation = self.expectation(description: "Loading")
        var sutError: Error?
        var sutData: Data?
        session.dataTask(with: unsecureUrl) { (data, responce, error) in
            sutError = error
            sutData = data
            expectation.fulfill()
        }.resume()
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(sutError)
        XCTAssertNil(sutData)
    }
    
    func testsSecuritySessionApprovesSecuredUrl() {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: SecureURLSession(), delegateQueue: nil)
        let secureUrl = URL(string: "https://www.coindesk.com")!
        
        let expectation = self.expectation(description: "Loading")
        var sutError: Error?
        var sutData: Data?
        session.dataTask(with: secureUrl) { (data, responce, error) in
            sutError = error
            sutData = data
            expectation.fulfill()
        }.resume()
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNil(sutError)
        XCTAssertNotNil(sutData)
    }
}

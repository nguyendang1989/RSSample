//
//  RSSSampleUnitTests.swift
//  RSSSampleUnitTests
//
//  Created by Nguyen Hai Dang on 7/8/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import XCTest

@testable import RSSSample

class RSSSampleUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_serverAPI_dataNotNil() {
        let expectation = XCTestExpectation(description: "Successfully get data from RSS")
        guard let url = URL(string: URLConstants.baseURL) else {
            XCTFail("Invalid URL")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            
            expectation.fulfill()
        }
        
        dataTask.resume()
        wait(for: [expectation], timeout: 10)
    }
    
    func test_responseData_dataEncodable() {
        let expectation = XCTestExpectation(description: "Successfully get data from RSS")
        guard let url = URL(string: URLConstants.baseURL) else {
            XCTFail("Invalid URL")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                XCTFail("Data is nil")
                return
            }
            let rawData = try? JSONDecoder().decode(RawData.self, from: data)
            XCTAssertNotNil(rawData)
            XCTAssertNotNil(rawData?.feed)
            XCTAssertNotNil(rawData?.feed.results)
            expectation.fulfill()
        }
        
        dataTask.resume()
        wait(for: [expectation], timeout: 10)
    }
    
    func test_defaultBaseUrl_hasExpectedCount() {
        let expectation = XCTestExpectation(description: "Successfully get data from RSS")
        guard let url = URL(string: URLConstants.baseURL) else {
            XCTFail("Invalid URL")
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                XCTFail("Data is nil")
                return
            }
            let rawData = try? JSONDecoder().decode(RawData.self, from: data)
            XCTAssertNotNil(rawData)
            XCTAssertNotNil(rawData?.feed)
            XCTAssertNotNil(rawData?.feed.results)
            XCTAssertEqual(rawData?.feed.results.count, 100)
            expectation.fulfill()
        }
        
        dataTask.resume()
        wait(for: [expectation], timeout: 10)
    }

}

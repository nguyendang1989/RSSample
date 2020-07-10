//
//  RSSSampleUITests.swift
//  RSSSampleUITests
//
//  Created by Nguyen Hai Dang on 7/9/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import XCTest
class RSSSampleUITests: XCTestCase {
    
    var app: XCUIApplication!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableViewAndCellExist() {
        let tableView = app.tables["tableViewAccessibilityIdentifier"]
        let cell = tableView.staticTexts.element(boundBy: 100)
        
        XCTAssertNotNil(tableView)
        XCTAssertNotNil(cell)
    }
    
    func testSelectCellShouldOpenDetailView() {
        let cell = app.tables["tableViewAccessibilityIdentifier"].staticTexts.element(boundBy: 10)
        cell.tap()
        XCTAssertNotNil(app.otherElements["albumImage"])
    }
    
    func testDetailViewTapItunesButtonShouldOpenItunesStore() {
        guard ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] == nil else {
            XCTAssert(true, "Ignore Simulator Environment")
            return
        }
        
        let tableCell = app.tables["tableViewAccessibilityIdentifier"].staticTexts.element(boundBy: 5)
        tableCell.tap()
        
        let itunesButton = app.buttons["ituneButton"]
        itunesButton.tap()
        
        XCTAssertNotNil(app.tabBars.buttons["Library"])
    }

}

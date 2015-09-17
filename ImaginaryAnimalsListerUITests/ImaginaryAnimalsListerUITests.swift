//
//  ImaginaryAnimalsListerUITests.swift
//  ImaginaryAnimalsListerUITests
//
//  Created by Irene Chen on 9/17/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import XCTest

class ImaginaryAnimalsListerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test7CellsExistInTableView() {
        let app = XCUIApplication()
        XCTAssert(app.tables.cells.count == 7)
    }
    
    func testBackButtonAppears() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        XCUIApplication().tables.staticTexts["1. Mermaid"].tap()
        let back = app.navigationBars["ImaginaryAnimalsLister.DetailView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0)
        XCTAssert(back.exists)
        back.tap()
        XCTAssertFalse(back.exists)
        
    }
    
    func testDetailViewLabelsAndImageView() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["1. Mermaid"].tap()
        app.staticTexts["Name: Mermaid"].tap()
        
        let detailimageviewImage = app.images["DetailImageView"]
        detailimageviewImage.tap()
        
        let imaginaryanimalslisterDetailviewNavigationBar = app.navigationBars["ImaginaryAnimalsLister.DetailView"]
        imaginaryanimalslisterDetailviewNavigationBar.tap()
        
        let backButton = imaginaryanimalslisterDetailviewNavigationBar.childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0)
        backButton.tap()
        tablesQuery.staticTexts["3. Bigfoot"].tap()
        detailimageviewImage.tap()
        detailimageviewImage.tap()
        app.staticTexts["Date last seen: 1963"].tap()
        backButton.tap()
        tablesQuery.staticTexts["6. Unicorn"].tap()
        backButton.tap()
        //        let app = XCUIApplication()
//        app.tables.staticTexts["1.Mermaid"]
    }
    
}

//
//  TableViewControllerTests.swift
//  ImaginaryAnimalsLister
//
//  Created by Irene Chen on 9/17/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import XCTest
@testable import ImaginaryAnimalsLister

class TableViewControllerTests: XCTestCase {
    
    var tableViewController:TableViewController?
    
    override func setUp() {
        super.setUp()
        
        tableViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("TableViewController") as? TableViewController
        tableViewController?.animalsArray = AnimalsLoader().loadAnimals()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfCellsEqualToNumberOfAnimals() {
        
        XCTAssert(tableViewController?.animalsArray.count > 0)
        XCTAssertEqual(tableViewController?.animalsArray.count, tableViewController?.tableView .numberOfRowsInSection(0))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

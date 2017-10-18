//
//  Fruits.swift
//  Fruit TestsTests
//
//  Created by Eduardo Vital Alencar Cunha on 18/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import XCTest
@testable import Fruit_Tests

class FruitsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitFromDictionary() {
        let fruitDictionary = [
            "name": "Abacate",
            "group": "Verde",
        ]

        let fruit = Fruits(fromDictionary: fruitDictionary)

        XCTAssertNotNil(fruit)
    }

    func testInitFromWrongDictionary() {
        let fruitDictionary = [
            "invalidNameKey": "Abacate",
            "group": "Verde",
        ]

        let fruit = Fruits(fromDictionary: fruitDictionary)

        XCTAssertNil(fruit)
    }



}

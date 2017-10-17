//
//  Fruit_TestsTests.swift
//  Fruit TestsTests
//
//  Created by Guilherme Baldissera on 16/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import XCTest
@testable import Fruit_Tests

class FruitsManagerTest: XCTestCase {
    var fruits = [Fruits]()
    
    override func setUp() {
        super.setUp()

        fruits.append(Fruits(name: "banana", group: "amarela"))
        fruits.append(Fruits(name: "abacaxi", group: "amarela"))
        fruits.append(Fruits(name: "tomate", group: "vermelha"))
        fruits.append(Fruits(name: "kiwi", group: "verde"))

    }
    
    override func tearDown() {
        super.tearDown()
        fruits = [Fruits]()
    }

    func testLoadGroups() {
        let correctGroups = ["amarela", "verde", "vermelha"]

        let groups = FruitsManager.loadGroups(from: fruits)

        XCTAssert(correctGroups == groups, "Error in method load groups of fruits")

        XCTAssert(correctGroups.count == groups.count, "Error in method load groups of fruits, count are not correctly")
    }

    func testLoadNames() {
        let correctNames = ["abacaxi", "banana", "kiwi", "tomate"]

        let names = FruitsManager.loadNames(from: fruits)

        XCTAssert(correctNames == names, "Error in method load names of fruits")

        XCTAssert(correctNames.count == names.count, "Error in method load names of fruits, count are not correctly")
    }

    func testFilterWithYellowColor() {
        let correctFruits = ["abacaxi", "banana"]

        let fruitsNames = FruitsManager.filter(fruits: fruits, byGroup: "amarela")

        XCTAssert(correctFruits == fruitsNames, "Error in method filter of fruits")
    }

    func testFilterReturnAll() {
        let correctNames = ["abacaxi", "banana", "kiwi", "tomate"]

        let fruitsNames = FruitsManager.filter(fruits: fruits)

        XCTAssert(correctNames == fruitsNames, "Error in method filter of fruits")
    }

    func testInvalidFilter() {
        let correctFruits = [String]()

        let fruitsNames = FruitsManager.filter(fruits: fruits, byGroup: "rosa")

        XCTAssert(correctFruits == fruitsNames, "Error in method filter of fruits")
    }

    func testLoadFruits() {
        let fruits = FruitsManager.loadFruits(inBundle: Bundle(for: type(of: self)))

        XCTAssert(fruits.count != 0)
    }

    func testPerformanceOfLoadFruits() {
        self.measure {
            _ = FruitsManager.loadFruits(inBundle: Bundle(for: type(of: self)))
        }
    }

    func testPerformanceLoadGroups() {
        self.measure {
            _ = FruitsManager.loadGroups(from: self.fruits)
        }
    }

    func testPerformanceLoadNames() {
        self.measure {
            _ = FruitsManager.loadNames(from: self.fruits)
        }
    }

    func testPerfomenaceFilter() {
        self.measure {
            _ = FruitsManager.filter(fruits: self.fruits, byGroup: "amarela")
        }
    }

    func testReturnNormalizedGroups() {
        let groups = ["Amarelo", "Vermelho"]

        let result = FruitsManager.returnNormalizedGroups(groups, at: 1)

        XCTAssert(result == "Amarelo")
    }

    func testReturnAllInNormalizedGroups() {
        let groups = ["Amarelo", "Vermelho"]

        let result = FruitsManager.returnNormalizedGroups(groups, at: 0)

        XCTAssert(result == nil)
    }
}

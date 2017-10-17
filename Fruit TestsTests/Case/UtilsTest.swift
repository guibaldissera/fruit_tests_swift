//
//  UtilsTest.swift
//  Fruit TestsTests
//
//  Created by Eduardo Vital Alencar Cunha on 17/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import XCTest
@testable import Fruit_Tests

class UtilsTest: XCTestCase {
    var list = [String]()

    override func setUp() {
        super.setUp()
        self.list = ["Amor", "Ódio", "Ciúme", "Inveja", "Compaixão"]
    }

    func testSortListByAsc() {
        let correctedOrder = [
            "Amor",
            "Ciúme",
            "Compaixão",
            "Inveja",
            "Ódio",
        ]

        let sortedList = Utils.sort(list: self.list, by: .ascendent)

        XCTAssert(correctedOrder == sortedList, "Array was not correctly sorted or I am a dumbass tester")
    }

    func testSortListByDesc() {
        let correctedOrder = [
            "Ódio",
            "Inveja",
            "Compaixão",
            "Ciúme",
            "Amor",
        ]

        let sortedList = Utils.sort(list: self.list, by: .descendent)

        XCTAssert(correctedOrder == sortedList, "Array was not correctly sorted or I am a dumbass tester")
    }
    
}

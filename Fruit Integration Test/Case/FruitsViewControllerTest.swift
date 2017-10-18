//
//  FruitsViewControllerTest.swift
//  Fruit Integration Test
//
//  Created by Eduardo Vital Alencar Cunha on 18/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import XCTest
@testable import Fruit_Tests

class FruitsViewControllerTest: XCTestCase {

    var fruitsVC: FruitsViewController!

    override func setUp() {
        super.setUp()
        self.fruitsVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! FruitsViewController
        _ = self.fruitsVC.view
    }

    func testDefaultIBOutletsValues() {
        let numberOfFruitGroups = self.fruitsVC.groupPicker.numberOfRows(inComponent: 0)
        XCTAssert(numberOfFruitGroups == self.fruitsVC.fruitsGroups.count + 1)

        let numberOfFruitsNames = self.fruitsVC.fruitsTable.numberOfRows(inSection: 0)
        XCTAssert(numberOfFruitsNames == self.fruitsVC.fruitsNames.count)
    }

    func testChangeFruitGroupPicker() {
        let previousFruitsShowed = self.fruitsVC.fruitsTable.numberOfRows(inSection: 0)

        self.fruitsVC.groupPicker.delegate!.pickerView!(self.fruitsVC.groupPicker, didSelectRow: 1, inComponent: 0)

        var currentFruitsShowed = previousFruitsShowed

        currentFruitsShowed = self.fruitsVC.fruitsTable.numberOfRows(inSection: 0)

        XCTAssert(previousFruitsShowed != currentFruitsShowed)
    }

    func testAppIntegrationPerformance() {
        self.measure {
            self.fruitsVC.groupPicker.delegate!.pickerView!(self.fruitsVC.groupPicker, didSelectRow: 1, inComponent: 0)
        }
    }

}

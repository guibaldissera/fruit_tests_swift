//
//  Fruit_UITests.swift
//  Fruit UITests
//
//  Created by Eduardo Vital Alencar Cunha on 19/10/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import XCTest

class Fruit_UITests: XCTestCase {
        
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
    
    func testExample() {
//        let picker = XCUIApplication().pickerWheels

        let allPickerWheel = XCUIApplication().pickerWheels["All"]
        allPickerWheel.descendants(matching: .any).tap()

//        let allPickerWheel = XCUIApplication()/*@START_MENU_TOKEN@*/.pickerWheels["All"]/*[[".pickers.pickerWheels[\"All\"]",".pickerWheels[\"All\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//


//        allPickerWheel.tap()
//        allPickerWheel.tap()
//        allPickerWheel.tap()
//        allPickerWheel.tap()
//        allPickerWheel.tap()
//        allPickerWheel.tap()
//        picker.element


        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

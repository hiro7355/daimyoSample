//
//  daimyoSampleUITests.swift
//  daimyoSampleUITests
//
//  Created by 野澤 通弘 on 2017/12/01.
//  Copyright © 2017年 ikaika software. All rights reserved.
//

import XCTest

class daimyoSampleUITests: XCTestCase {
        
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
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        

        
        let app = XCUIApplication()
        let dashboardNavigationBar = app.navigationBars["DashBoard"]
        let dashboardbuttonButton = dashboardNavigationBar/*@START_MENU_TOKEN@*/.buttons["dashBoardButton"]/*[[".buttons[\"DashBoard\"]",".buttons[\"dashBoardButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dashboardbuttonButton.tap()
        
        let historybottonButton = dashboardNavigationBar/*@START_MENU_TOKEN@*/.buttons["historyBotton"]/*[[".buttons[\"History\"]",".buttons[\"historyBotton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        historybottonButton.tap()
        
        let speedtestbuttonButton = dashboardNavigationBar/*@START_MENU_TOKEN@*/.buttons["speedTestButton"]/*[[".buttons[\"SpeedTest\"]",".buttons[\"speedTestButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        speedtestbuttonButton.tap()
        
        let speedtestviewElement = app.otherElements["speedTestView"]
        speedtestviewElement.swipeLeft()
        app.otherElements["dashBoardView"].swipeLeft()
        
        let historyviewElement = app.otherElements["historyView"]
        historyviewElement.swipeLeft()
        historyviewElement.swipeRight()
//        speedtestviewElement.swipeRight()
  //      speedtestviewElement.swipeRight()
        dashboardbuttonButton.tap()
        speedtestbuttonButton.tap()
        historybottonButton.tap()
        
   //     XCTAssertTrue(speedtestviewElement.isEnabled)

    }
    
}

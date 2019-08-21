//
//  DivisionUITests.swift
//  DivisionUITests
//
//  Created by Soni Suman on 8/19/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import XCTest

class DivisionUITests: XCTestCase {
  let app = XCUIApplication()
  let device = XCUIDevice.self
  let element = XCUIElement.self
  
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
  func testmainScreen() {
    let firstLabel =  app.staticTexts["Enter two number"]
    XCTAssertTrue(firstLabel.exists, "should be present in main screen")
  }
  func test10DevideBy2() {
    let dev1 = app.textFields.element(boundBy: 0)
    let dev2 = app.textFields.element(boundBy: 1)
    dev1.tap()
    dev1.typeText("10")
    dev2.tap()
    
    let app = XCUIApplication()
    let element = app.otherElements.containing(.staticText, identifier:"Enter two number").children(matching: .other).element(boundBy: 0)
    element.children(matching: .textField).element(boundBy: 0).tap()
    
    let textField = element.children(matching: .textField).element(boundBy: 1)
    textField.tap()
    textField.tap()
    
    let calculateButton = app.buttons["Calculate"]
    calculateButton.tap()
    calculateButton.tap()
    calculateButton.tap()
    calculateButton.tap()
    calculateButton.tap()
    calculateButton.tap()
    calculateButton.tap()
    calculateButton.tap()
    dev2.typeText("2")
    app.buttons["Calculate"].tap()
    XCTAssertTrue(app.staticTexts["5"].exists, "result should be equal to 5.")
  }
  
  func test20DivideBy2() {
    
    let app = XCUIApplication()
    let element = app.otherElements.containing(.staticText, identifier:"Enter two number").children(matching: .other).element(boundBy: 0)
    element.children(matching: .textField).element(boundBy: 0).tap()
    
    let textField = element.children(matching: .textField).element(boundBy: 1)
    textField.tap()
    textField.tap()
    
    XCUIApplication().buttons["Calculate"].tap()
     XCTAssertTrue(app.staticTexts["10"].exists, "result should be equal to 20.")
  }

}

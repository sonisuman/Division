//
//  OnlineTestCases.swift
//  DivisionTests
//
//  Created by Soni Suman on 8/20/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import XCTest
let onlineCalculatorBrain = OnlinecalculatorBrain()

class OnlineTestCases: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

//  func testRetriveURLFor10dividedBy2() {
//    let url = URL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
//    let response = onlineCalculatorBrain.retriveURLForDivision(dividend: 10, divisior: 2)
//    XCTAssert(response == url, "url must be equal to https://www.calcatraz.com/calculator/api?c=10%2F2")
//  }
  
//  func testRetriveURLFor10dividedBy2ShouldFail() {
//    let url = URL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
//    let response = onlineCalculatorBrain.retriveURLForDivision(dividend: 10, divisior: 2)
//   XCTAssert(response != url, "url must be equal to https://www.calcatraz.com/calculator/api?c=10%2F2")
//  }
  
  func  testTwoNumbersCalculations() {
  
    onlineCalculatorBrain.calculateWithTwoNumbers(dividend: 10, divisior: 1) { (result, error) in
       XCTAssert(result == 5, "response should be equal to 5")
    }
  }
  func testCalculateDivideByZero()  {
    let expectations = XCTestExpectation(description: "expected callback from API!!!")
    
    onlineCalculatorBrain.calculateWithTwoNumbers(dividend: 10, divisior: 0) { [weak self](response, error) in
      if error == nil {
        //XCTFail()
      }
      else {
        XCTAssert(error?.localizedDescription == "division by zero", "response should be division by zero.")
        expectations.fulfill()
      } 
      self?.waitForExpectations(timeout: 3, handler: nil)
    }
  }
}

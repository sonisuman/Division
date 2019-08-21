//
//  DivisionTests.swift
//  DivisionTests
//
//  Created by Soni Suman on 8/19/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import XCTest
@testable import Division

class DivisionTests: XCTestCase {
  let calculatorBrain = CalculatorBrain()

    override func setUp() {
    }

    override func tearDown() {
    }
  func testDivisionMethod() {
     calculatorBrain.divideTwoNumbers(dividend: 10, divisior: 5) { (result, error) in
       XCTAssert(result == 2, "result must be 2")
    }
   
  }
  
  func testDivideBy0() {
    calculatorBrain.divideTwoNumbers(dividend: 10, divisior: 0) { (result, error) in
     XCTAssertNil(result)
      XCTAssert(error!.domain == "devide by zero", "error message does not match")
    }
  }
  
  func testDivisionTime() {
    measure {
      calculatorBrain.divideTwoNumbers(dividend: 10, divisior: 2) { (result, error) in
//        XCTAssert(result == 2, "result must be 2")
      }
    }
  }

}

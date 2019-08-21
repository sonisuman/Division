//
//  CalculatorBrain.swift
//  Division
//
//  Created by Soni Suman on 8/19/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import UIKit

class CalculatorBrain: NSObject {
  func divideTwoNumbers(dividend: Int, divisior: Int,completion: ((_ result:Float?, _ error:NSError?) -> Void)) {
    if divisior == 0 {
      let error = NSError(domain: "devide by zero", code: 1, userInfo: nil)
      return completion(nil,error)
    }
    
    return completion(Float(dividend/divisior), nil)
   
  }
}

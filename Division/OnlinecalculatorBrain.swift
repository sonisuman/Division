//
//  OnlinecalculatorBrain.swift
//  Division
//
//  Created by Soni Suman on 8/20/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import UIKit

class OnlinecalculatorBrain: NSObject {
  func retriveURLForDivision(dividend: Int, divisior: Int) -> URL {
    return URL(string: "https://www.calcatraz.com/calculator/api?c=\(dividend)%2F\(divisior)")!
  }
  
  func calculateWithTwoNumbers(dividend: Int, divisior: Int,completionHandler: @escaping ((Float? , Error?)->())) {
    let url =  retriveURLForDivision(dividend: dividend, divisior: divisior)
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
      if error == nil {
        if let data = data {
          if let sValue =  String(data: data, encoding: String.Encoding.utf8) {
           return completionHandler((sValue as NSString).floatValue ,nil)
          }
          let localError = NSError(domain: "data not found", code: 1, userInfo: nil)
         return completionHandler(nil , localError)
        }
      }
      else {
        print(error?.localizedDescription ?? "")
       return completionHandler(nil, error)
      }
    }
    task.resume()
  }
}

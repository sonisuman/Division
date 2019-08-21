//
//  ViewController.swift
//  Division
//
//  Created by Soni Suman on 8/19/19.
//  Copyright © 2019 Soni Suman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let calculatorBrain = CalculatorBrain()
  let onlineCalculator = OnlinecalculatorBrain()
  @IBOutlet weak var secondTextField: UITextField!
  @IBOutlet weak var firsttextField: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    onlineCalculator.calculateWithTwoNumbers(dividend: 50, divisior: 5) { (response, error) in
      print(response ?? 0.0)
    }
    onlineCalculator.calculateWithTwoNumbers(dividend: 25, divisior: 5) { (response, error) in
      print(response ?? 0.0)
    }
    onlineCalculator.calculateWithTwoNumbers(dividend: 10, divisior: 0) { (response, error) in
      print(response ?? 0.0)
    }
  }

  @IBAction func calculateBtn(_ sender: UIButton) {
    if firsttextField.text != nil , secondTextField.text != nil {
      if let first = Int(firsttextField.text!) {
        if let second = Int(secondTextField.text!) {
          calculatorBrain.divideTwoNumbers(dividend: first, divisior: second) { (result, error) in
            if error == nil {
              if let result = result {
                let numberFormater = NumberFormatter()
                numberFormater.numberStyle = .decimal
                resultLabel.text = numberFormater.string(from: NSNumber(value: result))
              }
            }
          }
        }
      }
    }
  }
  
}


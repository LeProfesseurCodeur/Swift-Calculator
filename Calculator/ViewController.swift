//
//  ViewController.swift
//  Calculator
//
//  Created by Dylan Luchmun on 13/01/2020.
//  Copyright © 2020 Dylan Luchmun. All rights reserved.
//

import UIKit

// 12+16
// previousNumber
// numberOnScreen
//isPerformingOperation
// operation + - / *

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = ""
        
    }

    @IBAction func numberPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
        
        if isPerformingOperation == true {
            isPerformingOperation = false
            resultLabel.text = String(tag - 1)
            numberOnScreen = Double(resultLabel.text!)!
        } else {
            resultLabel.text = resultLabel.text! + String(tag - 1)
            numberOnScreen = Double(resultLabel.text!)!
        }
    }
    @IBAction func operatorPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
         
        if tag == 16 {
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            
            return
        }
        
        //operator +(14) -(13) /(11) x(12) = (15)*/
        
        if tag == 11 {
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "/"
            operation = tag
        } else if tag == 12 {
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "*"
             operation = tag
        } else if tag == 13 {
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "-"
            operation = tag
        } else if tag == 14 {
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            resultLabel.text = "+"
             operation = tag
        } else if tag == 15 {
            if operation == 11 {
                resultLabel.text = String(previousNumber / numberOnScreen)
            } else if operation == 12 {
                resultLabel.text = String(previousNumber * numberOnScreen)
            } else if operation == 13 {
                resultLabel.text = String(previousNumber - numberOnScreen)
            } else if operation == 14 {
                resultLabel.text = String(previousNumber + numberOnScreen)
            }
        }
    }
    
}

 

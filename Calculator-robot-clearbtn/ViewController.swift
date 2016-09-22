//
//  ViewController.swift
//  Calculator-robot-clearbtn
//
//  Created by Kacper Kowalski on 04.08.2016.
//  Copyright © 2016 Kacper Kowalski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation: String {
        case Add = "+"
        case Substract = "-"
        case Mulitply = "*"
        case Divide = "/"
        case Empty = "empty"
        
        
        
    }
    
    // Properties
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    var currentOperation: Operation = Operation.Empty
    
    // Outlets
    
    @IBOutlet weak var retroImg: UIImageView!
    @IBOutlet weak var retroBtn: UIButton!
    @IBOutlet weak var calcpanel: UIStackView!
    @IBOutlet weak var calcview: UIStackView!
    @IBOutlet weak var labelcalc: UILabel!
    
    // Functions - magic happens

    @IBAction func onRetroRobotPressed(sender: AnyObject) {
       
        calcview.hidden = false
        calcpanel.hidden = false
        labelcalc.hidden = false
        
        retroImg.hidden = true
        retroBtn.hidden = true
        
    }
    
    @IBAction func onNumberPressed(btn: UIButton!) {
        
        runningNumber += "\(btn.tag)"
        labelcalc.text = runningNumber
        
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
        
    }
    
    @IBAction func onSubstractPressed(sender: AnyObject) {
        processOperation(Operation.Substract)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Mulitply)
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func onClearBtnPressed(sender: AnyObject) {
        
        if labelcalc.text != "0" {
            
            runningNumber = ""
            leftValStr = ""
            rightValStr = ""
            currentOperation = Operation.Empty
            
        }
        
        labelcalc.text = "0"
        
        
        
    }
    
    
    
    func processOperation(op: Operation) {
        
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                
            
            rightValStr = runningNumber
            runningNumber = ""
            
            if currentOperation == Operation.Add {
                result = "\(Double(leftValStr)! + Double(rightValStr)!)"
            } else if currentOperation == Operation.Substract {
                result = "\(Double(leftValStr)! - Double(rightValStr)!)"
            } else if currentOperation == Operation.Mulitply {
                result = "\(Double(leftValStr)! * Double(rightValStr)!)"
            }else if currentOperation == Operation.Divide {
                result = "\(Double(leftValStr)! / Double(rightValStr)!)"
            }
                
            
            leftValStr = result
            labelcalc.text = result
            
            }
    
            currentOperation = op
        
    } else {
            
        leftValStr = runningNumber
        runningNumber = ""
        currentOperation = op
    
    }
    
}
}






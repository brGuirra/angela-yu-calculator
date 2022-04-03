//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Bruno Guirra on 03/04/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

enum Operation: String {
    case add = "+"
    case minus = "-"
    case multiply = "×"
    case divide = "÷"
}

struct CalculatorLogic {
    
    private var num: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNum(_ num: Double) {
        self.num = num
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let num = num {
            switch symbol {
                case "+/-":
                    return convertToPositive(num)
                case "AC":
                    return 0
                case "%":
                    return convertToPercentage(num)
                case "=":
                    return performCalculation(n2: num)
                default:
                    intermediateCalculation = (n1: num, calcMethod: symbol)
            }
        }
        
        return nil
    }
    
    private func convertToPositive(_ num: Double) -> Double {
        let result =  num * -1
        
        return result
    }
    
    private func convertToPercentage(_ num: Double) -> Double {
        let result = num / 100
        
        return result
    }
    
    private func performCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let calcMethod = intermediateCalculation?.calcMethod {
            switch calcMethod {
                case Operation.add.rawValue:
                    return n1 + n2
                case Operation.minus.rawValue:
                    return n1 - n2
                case Operation.multiply.rawValue:
                    return n1 * n2
                case Operation.divide.rawValue:
                    return n1 / n2
                default:
                    fatalError("The operation passed in does not match any of the cases")
            }
        }
        
        return nil
    }
}

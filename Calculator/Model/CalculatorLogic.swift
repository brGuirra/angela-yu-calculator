//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Bruno Guirra on 03/04/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var num: Double?
    
    mutating func setNum(_ num: Double) {
        self.num = num
    }
    
    func calculate(symbol: String) -> Double? {
        if let num = num {
            if symbol == "+/-" {
                return convertToPositive(num)
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return convertToPercentage(num)
            }
        }
        
        return nil
    }
    
    private func convertToPositive(_ num: Double) -> Double {
        let result =  num * -1
        
        return result
    }
    
    private func convertToPercentage(_ num: Double) -> Double {
        let result = num * 0.01
        
        return result
    }
}

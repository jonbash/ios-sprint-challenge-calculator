//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String += digit
            return operand1String
        } else {
            operand2String += digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        // treat 0 as operand1 if operator pressed without previous input
        if operand1String.isEmpty {
            operand1String = "0"
        }
        
        operatorType = OperatorType(rawValue: operatorString) // oh wow, this is way easier than the way I had been doing it setting up a separate dictionary >_<
    }
    
    func calculateIfPossible() -> String? {
        if operand1String.isEmpty || operand2String.isEmpty { return nil }
        if operatorType == nil { return nil }
        
        guard let operand1: Double = Double(operand1String) else { return nil }
        guard let operand2: Double = Double(operand2String) else { return nil }
        
        let solution: Double
        
        switch operatorType {
        case .addition:
            solution = operand1 + operand2
        case .subtraction:
            solution = operand1 - operand2
        case .multiplication:
            solution = operand1 * operand2
        case .division:
            if operand2 == 0 { return nil }
            solution = operand1 / operand2
        default:
            return nil
        }
        
        let solutionText = "\(solution)"
        
        operand1String = solutionText // use solution as operand1 for next operator press
        operand2String = ""
        
        return solutionText
    }
}

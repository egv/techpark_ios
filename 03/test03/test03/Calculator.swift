//
//  Calculator.swift
//  test03
//
//  Created by Gennady Evstratov on 06/10/2016.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation

class Calculator {
    
    private struct PendingBinaryOperation {
        let firstOperand: Double
        let operation: ((Double, Double) -> Double)
    }
    
    private enum OperationType {
        case unary((Double) -> Double)
        case binary((Double, Double) -> Double)
        case equal
    }

    private var pendingOperation: PendingBinaryOperation? = nil
    
    private var accumulator = 0.0
    
    
    private var operations: [String: OperationType] = [
        "√": OperationType.unary(sqrt),
        "∗": OperationType.unary({ $0*$0 }),
        "π": OperationType.unary({_ in return M_PI }),
        "+": OperationType.binary({ $0 + $1 }),
        "-": OperationType.binary({ $0 - $1 }),
        "/": OperationType.binary({ $0 / $1 }),
        "*": OperationType.binary({ $0 * $1 }),
        "=": OperationType.equal
    ]
    
    func setNumber(number: Double) {
        self.accumulator = number
    }
    
    func performOperation(operation: String) -> Double {
        guard let op = operations[operation] else {
            return -1
        }
        
        switch op {
        case .unary(let f):
            return f(accumulator)

        case .binary(let f):
            pendingOperation = PendingBinaryOperation(firstOperand: accumulator, operation: f)
            return accumulator
            
        case .equal:
            if let pending = pendingOperation {
                pendingOperation = nil
                return pending.operation(pending.firstOperand, accumulator)
            } else {
                return accumulator
            }
        }
    }
}

//
//Swift 2 Tutorial Part 2: A Simple iOS App
//@ Ray Wenderlich on September 21, 2015
//https://www.raywenderlich.com/115279/swift-2-tutorial-part-2-a-simple-ios-app
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Erkin Kholmatov on 16/05/16.
//  Copyright © 2016 Erkin Kholmatov. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
    
}

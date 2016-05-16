//
//Swift 2 Tutorial Part 2: A Simple iOS App
//@ Ray Wenderlich on September 21, 2015
//https://www.raywenderlich.com/115279/swift-2-tutorial-part-2-a-simple-ios-app
//  ViewController.swift
//  TipCalculator
//
//  Created by Erkin Kholmatov on 16/05/16.
//  Copyright © 2016 Erkin Kholmatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI() {
        // 1
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        // 2
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        // 3
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        // 4
        resultsTextView.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTapped(sender : AnyObject) {
        // 1
        tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        // 2
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        // 3
        for (tipPct, tipValue) in possibleTips {
            // 4
            results += "\(tipPct)%: \(tipValue)\n"
        }
        // 5
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()
    }


}


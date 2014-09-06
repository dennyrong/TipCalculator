//
//  ViewController.swift
//  tip
//
//  Created by Kun Rong on 9/3/14.
//  Copyright (c) 2014 Kun Rong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    // set bill labels (split by 1/2/3/4 person)
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalLabel_2: UILabel!
    @IBOutlet weak var totalLabel_3: UILabel!
    @IBOutlet weak var totalLabel_4: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalView: UIView!
    
    
    var defaults = NSUserDefaults.standardUserDefaults()
    var tipPercentages = [0.15, 0.2, 0.25]
   
    var symbol = "$"
    var currency = 1.0
    
    var symbols = ["￥","$", "€"]
    var currencies = [6.13, 1.0, 1.5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        totalLabel_2.text = "$0.00"
        totalLabel_3.text = "$0.00"
        totalLabel_4.text = "$0.00"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        
        if billField.text.isEmpty {
            self.totalView.alpha = 0
            self.tipControl.alpha = 0
            //self.billField.text = "$"
           // self.billField.textColor = blueColor()
            self.billField.center = CGPointMake(160, 200)
            
        } else {
            self.tipControl.alpha = 1
            self.totalView.alpha = 1
            self.billField.center = CGPointMake(160, 120)
        }
        
        var currency_mode = defaults.integerForKey("currency")
        symbol = symbols[currency_mode]
        currency = currencies[currency_mode]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = NSString(string: billField.text).doubleValue
        
        var tip = billAmount * tipPercentage * currency
        var total = tip + billAmount * currency
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = symbol + String(format: "%.2f", tip)
        
        totalLabel.text = symbol + NSString(format: "%.2f", total)
        totalLabel_2.text = symbol + NSString(format: "%.2f", total/2)
        totalLabel_3.text = symbol + NSString(format: "%.2f", total/3)
        totalLabel_4.text = symbol + NSString(format: "%.2f", total/4)
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
        var tipRate1 = defaults.floatForKey("firstTipRate")
        tipControl.setTitle("\(tipRate1)%", forSegmentAtIndex: 0)
        tipPercentages[0] = Double(tipRate1/100)
        
        var tipRate2 = defaults.floatForKey("secondTipRate")
        tipControl.setTitle("\(tipRate2)%", forSegmentAtIndex: 1)
        tipPercentages[1] = Double(tipRate2/100)
        
        var tipRate3 = defaults.floatForKey("thirdTipRate")
        tipControl.setTitle("\(tipRate3)%", forSegmentAtIndex: 2)
        tipPercentages[2] = Double(tipRate3/100)
        
        var currency_mode = defaults.integerForKey("currency")
        symbol = symbols[currency_mode]
        currency = currencies[currency_mode]
        
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage * currency
        var total = tip + billAmount * currency
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = symbol + String(format: "%.2f", tip)
        
        totalLabel.text = symbol + NSString(format: "%.2f", total)
        totalLabel_2.text = symbol + NSString(format: "%.2f", total/2)
        totalLabel_3.text = symbol + NSString(format: "%.2f", total/3)
        totalLabel_4.text = symbol + NSString(format: "%.2f", total/4)
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


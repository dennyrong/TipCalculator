//
//  UserViewController.swift
//  tip
//
//  Created by Kun Rong on 9/3/14.
//  Copyright (c) 2014 Kun Rong. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var Rate1: UILabel!
    @IBOutlet weak var Rate2: UILabel!
    @IBOutlet weak var Rate3: UILabel!
    
    @IBOutlet weak var tipRate1: UISlider!
    @IBOutlet weak var tipRate2: UISlider!
    @IBOutlet weak var tipRate3: UISlider!
    
    @IBOutlet weak var currencySegement: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnSwipe(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    @IBAction func ChangeCurrency(sender: AnyObject) {
        defaults.setInteger(currencySegement.selectedSegmentIndex, forKey: "currency")
    }
    @IBAction func SetRate1(sender: AnyObject) {
        var tipvalue = tipRate1.value*100
        Rate1.text = "\(tipvalue)"
        Rate1.text = String(format: "%.2f", tipvalue) + "%"
        defaults.setInteger(Int (tipvalue), forKey: "firstTipRate")
        defaults.synchronize()
    }
    @IBAction func SetRate2(sender: AnyObject) {
        var tipvalue = tipRate2.value*100
        Rate2.text = "\(tipvalue)"
        Rate2.text = String(format: "%.2f", tipvalue) + "%"
        defaults.setInteger(Int (tipvalue), forKey: "secondTipRate")
        defaults.synchronize()
    }
    @IBAction func SetRate3(sender: AnyObject) {
        var tipvalue = tipRate3.value*100
        Rate3.text = "\(tipvalue)"
        Rate3.text = String(format: "%.2f", tipvalue) + "%"
        defaults.setInteger(Int (tipvalue), forKey: "thirdTipRate")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view did appear")
        var tip1 = defaults.integerForKey("firstTipRate")
        tipRate1.setValue(Float(tip1)/100, animated: true)
        Rate1.text = "\(tip1)"
        println(tip1)
        Rate1.text = String(format: "%.2f", Float(tip1)) + "%"
        
        var tip2 = defaults.integerForKey("secondTipRate")
        tipRate2.setValue(Float(tip2)/100, animated: true)
        Rate2.text = "\(tip2)"
        println(tip2)
        Rate2.text = String(format: "%.2f", Float(tip2)) + "%"
        
        var tip3 = defaults.integerForKey("thirdTipRate")
        tipRate3.setValue(Float(tip3)/100, animated: true)
        Rate3.text = "\(tip3)"
        Rate3.text = String(format: "%.2f", Float(tip3)) + "%"
        
        currencySegement.selectedSegmentIndex = defaults.integerForKey("currency")
        //self.Rate1.backgroundColor = UIColor
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

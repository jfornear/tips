//
//  ViewController.swift
//  tips
//
//  Created by Jesse Fornear on 8/21/14.
//  Copyright (c) 2014 Jesse Fornear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var fieldContainer: UIView!
    
    var expandedContainer = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    
        self.fieldContainer.frame.size.height += 120
        self.fieldContainer.center.y += 60
        self.tipControl.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if billField.text == "" {
            UIView.animateWithDuration(0.3, animations: {
                // This expands and animates the fieldContainer
                self.fieldContainer.frame.size.height += 120
                self.fieldContainer.center.y += 60
                self.tipControl.alpha = 0
                self.expandedContainer = true
            })
        } else {
            if self.expandedContainer == true {
                UIView.animateWithDuration(0.3, animations: {
                    // This contracts and animates the fieldContainer
                    self.fieldContainer.frame.size.height = 215
                    self.fieldContainer.center.y -= 60
                    self.tipControl.alpha = 1
                    self.expandedContainer = false
                })
            }
        }

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}


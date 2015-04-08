//
//  ViewController.swift
//  FibonacciApp
//
//  Created by Aaron Ackerman on 4/7/15.
//  Copyright (c) 2015 Aaron Ackerman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var includesZeroSwitch: UISwitch!
    @IBOutlet weak var includesZeroLabel: UILabel!
    @IBOutlet weak var numberOfItemsSlider: UISlider!
    @IBOutlet weak var numberOfItemsLabel: UITextView!
    
    var fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: 2, includesZero: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.updateFibonacciSequence()
        
        let alert = UIAlertView()
        alert.title = "Fibonacci Sequence"
        alert.message = "Created by Aaron Ackerman"
        alert.addButtonWithTitle("OK")
        alert.show()
        
    }
    

    @IBAction func updateFibonacciSequence() {
        
        //Fix for the iPhone 5 issue.
        fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: UInt64(numberOfItemsSlider.value), includesZero: includesZeroSwitch.on)
        
       numberOfItemsLabel.text = String(Int(numberOfItemsSlider.value))
        
        //Slider's maximum value
        if includesZeroSwitch.on {
            
            numberOfItemsSlider.maximumValue = 94
        } else {
            numberOfItemsSlider.maximumValue = 93
        }
        
        //Changing the switch label text
        includesZeroLabel.text = includesZeroSwitch.on ? "Yes" : "No"
        
        textView.text = fibonacciSequence.values.description
    }


}


//
//  ViewController.swift
//  BMI
//
//  Created by Nicholas Outram on 30/12/2014.
//  Modified by Derion Lipford on 4/8/2016.
//  Copyright (c) 2014 Plymouth University. All rights reserved.
//
// 04-11-2015  Updated for Swift 2

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
   var weight : Double?
   var height : Double?
   
    //BMI Calculation Function
    var bmi : Double? {
      get {
         if (weight != nil) && (height != nil) {
            return weight! / (height! * height!)
         } else {
            return nil
         }
      }
   }
   
   @IBOutlet weak var bmiLabel: UILabel!
   @IBOutlet weak var heightTextField: UITextField!
   @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightPickerView: UIPickerView!
    @IBOutlet weak var weightPickerView: UIPickerView!
    
   /* Start of Default Setup Code*/
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   //This function dismissed the keyboard
   func textFieldShouldReturn(textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
   }
   
   func updateUI() {
      if let b = self.bmi {
         self.bmiLabel.text = String(format: "%4.1f", b)
      }
   }
   /* End of Default Setup Code*/
   
   //Called when ever the textField loses focus
   func textFieldDidEndEditing(textField: UITextField) {
      
      //First we check if textField.text actually contains a (wrapped) String
      guard let txt : String = textField.text else {
         //Simply return if not
         return
      }
      
      //At this point, txt is of type String. Here is a nested function that will be used
      //to parse this string, and convert it to a wrapped Double if possible.
      func conv(numString : String) -> Double? {
         let result : Double? = NSNumberFormatter().numberFromString(numString)?.doubleValue
         return result
      }
      
      //Which textField is being edit?
      switch (textField) {
         
      case heightTextField:
         self.height = conv(txt)
         
      case weightTextField:
         self.weight = conv(txt)
         
         //default must be here to give complete coverage. A safety precaution.
      default:
         print("Something bad happened!")
         
      } //end of switch
      
      //Last of all, update the user interface.
      updateUI()
      
   }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       //TBD: Write this code
        
        return 1
    }
   
}





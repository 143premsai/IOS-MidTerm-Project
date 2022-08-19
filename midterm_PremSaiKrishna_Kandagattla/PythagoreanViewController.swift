//
//  PythagoreanViewController.swift
//  midterm_PremSaiKrishna_Kandagattla
//
//  Created by user206624 on 7/7/22.
//

import UIKit

class PythagoreanViewController: UIViewController {

    // Inputs
    @IBOutlet weak var valueA: UITextField!
    @IBOutlet weak var valueB: UITextField!
    
    // custom output message
    let emptyMessage = "Enter a value for A and B to find C"
    
    @IBOutlet weak var messageC: UILabel!
    @IBOutlet weak var valueC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to close the keyboard after entering
        let tapDimissKeyboard = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tapDimissKeyboard)
        
        // to display output message in multiple lines
        messageC.numberOfLines = 0;
        valueC.numberOfLines = 0
    }
    
    // dismisskeyboard functionality when editing done
    @objc func dismissKeyboard() {
            view.endEditing(true)
    }
    
    // dismiss keyboard when enter in text field
    @IBAction func dismissKeyboardAfterEnter(_ sender: Any) {
        dismissKeyboard()
    }
    
    // calculate pythagorean value
    @IBAction func calculateValueC(_ sender: Any) {
        dismissKeyboard()
        if (valueA.text == "" || valueB.text == "") {
            messageC.text = emptyMessage
            valueC.text = ""
        } else {
            let calc = sqrt(pow(Double(valueA.text!)!, 2) + pow(Double(valueB.text!)!, 2))
            
            messageC.text = "The value of C according to Pythagorean is"
            valueC.text = "\(calc)"
        }
    }
    
    // Clearing the values
    @IBAction func clearValues(_ sender: Any) {
        dismissKeyboard()
        valueA.text = ""
        valueB.text = ""
        messageC.text = emptyMessage
        valueC.text = ""
    }
   

}

//
//  ViewController.swift
//  midterm_PremSaiKrishna_Kandagattla
//
//  Created by user206624 on 7/7/22.
//

import UIKit

class InputsViewController: UIViewController {

    // Inputs
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userInput: UITextField!
    
    var cities = ["calgary","halifax","montreal","toronto","vancouver","winnipeg"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tap on screen to dismiss keyboard
        let tapDimissKeyboard = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard));
        view.addGestureRecognizer(tapDimissKeyboard);
                
    }

    // override dismiss keyboard after edit done
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    // function to display the image based on your input
    @IBAction func findMyCity(_ sender: Any) {
        dismissKeyboard();
        
        for image in cities {
            let trimString = userInput.text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            if (image == trimString){
                userImage.image = UIImage(named: image)
                break;
            }
        }
    }
    
    
}


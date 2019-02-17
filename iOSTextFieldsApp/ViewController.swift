//
//  ViewController.swift
//  iOSTextFieldsApp
//
//  Created by Wendy Dherin on 2/17/19.
//  Copyright © 2019 WendyDherin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockableTextFieldSwitch: UISwitch!
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.zipCodeTextField.delegate = zipCodeDelegate
        self.cashTextField.delegate = cashDelegate
        self.lockableTextField.delegate = self
        self.lockableTextFieldSwitch.setOn(false, animated: false)
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.lockableTextFieldSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func toggleSwitch(_ sender: AnyObject) {
        if !(sender as! UISwitch).isOn {
            self.lockableTextField.resignFirstResponder()
        }
        
    }
}


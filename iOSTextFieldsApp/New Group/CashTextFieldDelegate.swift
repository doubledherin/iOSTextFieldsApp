//
//  CashTextFieldDelegate.swift
//  iOSTextFieldsApp
//
//  Created by Wendy Dherin on 2/17/19.
//  Copyright © 2019 WendyDherin. All rights reserved.
//
import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let current = textField.text! as NSString
        var replacement = current.replacingCharacters(in: range, with: string)
        var replacementString = String(replacement)
        
        let digits = CharacterSet.decimalDigits
        var digitString = ""
        for character in (replacementString.unicodeScalars) {
            if digits.contains(UnicodeScalar(character.value)!) {
                digitString.append("\(character)")
            }
        }
        
        if let totalInPennies = Int(digitString) {
            replacement = "$" + self.getDollars(totalInPennies) + "." + self.getCents(totalInPennies)
        } else {
            replacement = "$0.00"
        }
        
        textField.text = replacement
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    private func getDollars(_ totalInPennies: Int) -> String {
        return String(totalInPennies / 100)
    }
    
    private func getCents(_ totalInPennies: Int) -> String {
        let cents = totalInPennies % 100
        return cents >= 10 ? String(cents) : "0" + String(cents)
    }
}

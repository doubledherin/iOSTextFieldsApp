//
//  ZipCodeTextFieldDelegate.swift
//  iOSTextFieldsApp
//
//  Created by Wendy Dherin on 2/17/19.
//  Copyright © 2019 WendyDherin. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        var newTextString = String(newText)
        let digits = CharacterSet.decimalDigits
        var digitString = ""
        for character in (newTextString.unicodeScalars) {
            if digits.contains(UnicodeScalar(character.value)!) {
                digitString.append("\(character)")
            }
        }
        newTextString = digitString
        return newTextString.count <= 5
//        let current = textField.text! as NSString
//        let replacement = String(current.replacingCharacters(in: range, with: string))
//
//        textField.text = digitString
//        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text!.count == 5 {
            textField.resignFirstResponder()
            return true
        }
        return false
    }
}

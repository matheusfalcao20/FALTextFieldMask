//
//  FALTextFieldMask.swift
//  FALTextFieldMask Example
//
//  Created by Matheus Falcão on 06/09/16.
//  Copyright © 2016 NOCLAF TECH. All rights reserved.
//

import UIKit

class FALTextFieldMask : NSObject, UITextFieldDelegate {
    
    fileprivate static var sharedInstance : FALTextFieldMask!
    
    /* **************************************************************************************************
     **
     **  MARK: get Instance
     **
     ****************************************************************************************************/
    
    static func getInstance() -> FALTextFieldMask {
        
        if sharedInstance == nil {
            sharedInstance = FALTextFieldMask()
        }
        
        return sharedInstance
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Text Field Delegate
     **
     ****************************************************************************************************/
    
    @objc func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.characters.count == 0 {
            return true
        }
        
        var num = textField.text?.characters.count
        
        if num != nil {
            
            if num! >= textField.maskFAL.characters.count {
                return false
            }
            
            var charAtIndex = textField.maskFAL[textField.maskFAL.index(textField.maskFAL.startIndex, offsetBy: num!)]
            
            while( charAtIndex != "N" && charAtIndex != "F" && charAtIndex != "S" ) {
                
                textField.text = textField.text! + "\(charAtIndex)"
                
                num = num! + 1
                
                charAtIndex = textField.maskFAL[textField.maskFAL.index(textField.maskFAL.startIndex, offsetBy: num!)]
                
            }
            
            switch charAtIndex {
                
            case "N":
                let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
                
                return string.rangeOfCharacter(from: invalidCharacters, options: [], range:  string.startIndex..<string.endIndex) == nil
                
            case "F":
                let invalidCharacters = CharacterSet(charactersIn: "0123456789.,").inverted
                
                return string.rangeOfCharacter(from: invalidCharacters, options: [], range:  string.startIndex..<string.endIndex) == nil
                
            case "S":
                return true
                
            default:
                return false
                
            }
            
            
        }
    
        return false
        
    }
    
}

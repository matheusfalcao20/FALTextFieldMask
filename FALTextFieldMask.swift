//
//  FALTextFieldMask.swift
//
//  Created by Matheus Falcão on 06/09/16.
//

import UIKit

class FALTextFieldMask : NSObject, UITextFieldDelegate {
    
    private static var sharedInstance : FALTextFieldMask!
    
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
    
    @objc func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if string.characters.count == 0 {
            return true
        }
        
        var num = textField.text?.characters.count
        
        if num != nil {
            
            if num! >= textField.mask.characters.count {
                return false
            }
            
            var charAtIndex = textField.mask[textField.mask.startIndex.advancedBy(num!)]
            
            while( charAtIndex != "N" && charAtIndex != "F" && charAtIndex != "S" ) {
                
                textField.text = textField.text!.stringByAppendingString("\(charAtIndex)")
                
                num = num! + 1
                
                charAtIndex = textField.mask[textField.mask.startIndex.advancedBy(num!)]
                
            }
            
            switch charAtIndex {
                
            case "N":
                let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
                
                return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
                
            case "F":
                let invalidCharacters = NSCharacterSet(charactersInString: "0123456789.,").invertedSet
                
                return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
                
            case "S":
                return true
                
            default:
                return false
                
            }
            
            
        }
    
        return false
        
    }
    
}

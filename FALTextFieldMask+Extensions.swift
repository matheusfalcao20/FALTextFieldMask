//
//  FALTextFieldMask+Extensios.swift
//  FALTextFieldMask Example
//
//  Created by Matheus Falcão on 06/09/16.
//  Copyright © 2016 NOCLAF TECH. All rights reserved.
//

import UIKit

private var xoAssociationKey: UInt8 = 0

extension UITextField {
    
    var mask: String! {
        get {
            return objc_getAssociatedObject(self, &xoAssociationKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &xoAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
}

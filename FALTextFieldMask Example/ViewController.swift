//
//  ViewController.swift
//  FALTextFieldMask Example
//
//  Created by Matheus Falcão on 06/09/16.
//  Copyright © 2016 NOCLAF TECH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textfield : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray
    
        textfield = UITextField(frame: CGRect(x: 50, y: 50, width: 300, height: 50))
        textfield.placeholder = "Example"
        textfield.delegate = FALTextFieldMask.getInstance()
        textfield.maskFAL = "(NN) NNNN-NNNN"
        
        view.addSubview(textfield)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


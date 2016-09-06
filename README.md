# FALTextFieldMask
Simple Text Field Mask write in Swift

## Example

  In a hurry? Try out our FALTextFieldMask Example in this repository.

## Installation

 Copy the file "FALTextFieldMask.swift" and "FALTextFieldMask+Extensions.swift" inside your project.
 
## Code
 
 To use is very simple, this is a example:
 
```
    
import UIKit

class ViewController: UIViewController {
    
    var textfield : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.grayColor()
    
        textfield = UITextField(frame: CGRect(x: 50, y: 50, width: 300, height: 50))
        textfield.placeholder = "Example"
        textfield.delegate = FALTextFieldMask.getInstance()
        textfield.mask = "(NN) NNNN-NNNN"
        
        view.addSubview(textfield)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

```
    
    


 
 

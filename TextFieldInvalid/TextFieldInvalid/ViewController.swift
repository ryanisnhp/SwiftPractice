//
//  ViewController.swift
//  TextFieldInvalid
//
//  Created by Lam Le Van on 2/12/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet fileprivate weak var firstNameTextField: InvalidTextField!
    @IBOutlet fileprivate weak var lastNameTextField: InvalidTextField!
    @IBOutlet fileprivate weak var ageTextField: InvalidTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserProfile.instance.validate = { [weak self] enable in
            guard let strongSelf = self else {
                return
            }
//            strongSelf
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == firstNameTextField {
            UserProfile.instance.firstName = textField.text!
            return firstNameTextField.configTextField(with: range, string: string)
        } else if textField == lastNameTextField {
            UserProfile.instance.lastName = textField.text!
            return firstNameTextField.configTextField(with: range, string: string)
        } else {
            UserProfile.instance.lastName = textField.text!
            return ageTextField.configTextField(with: range, string: string)
        }
    }
    
}


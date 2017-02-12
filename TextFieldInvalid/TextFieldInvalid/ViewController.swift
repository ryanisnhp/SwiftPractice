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
    @IBOutlet fileprivate weak var confirmButton: ConfirmButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserProfile.instance.validate = { [weak self] isEnabled in
            guard let strongSelf = self else {
                return
            }
            strongSelf.confirmButton.isEnabled = isEnabled
        }
        UserProfile.instance.getUserProfile()
        firstNameTextField.text = UserProfile.instance.firstName
        lastNameTextField.text = UserProfile.instance.lastName
        ageTextField.text = UserProfile.instance.age
        firstNameTextField.config(textType: TextType.hiragana)
        lastNameTextField.config(textType: TextType.text)
        ageTextField.config(textType: TextType.number)
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
            print(textField.text!)
            return firstNameTextField.configTextField(with: range, string: string)
        } else if textField == lastNameTextField {
            UserProfile.instance.lastName = textField.text!
            print(textField.text!)
            return lastNameTextField.configTextField(with: range, string: string)
        } else {
            UserProfile.instance.age = textField.text!
            print(textField.text!)
            return ageTextField.configTextField(with: range, string: string)
        }
    }
    
}


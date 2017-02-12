//
//  ConfirmButton.swift
//  TextFieldInvalid
//
//  Created by Lam Le Van on 2/12/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ConfirmButton: UIButton {
    
    convenience override init(frame: CGRect) {
        self.init()
        setTitle("Success", for: .normal)
        setTitleColor(UIColor.black, for: .normal)
        setTitle("Fail", for: .disabled)
        setTitleColor(UIColor.red, for: .disabled)
    }
}

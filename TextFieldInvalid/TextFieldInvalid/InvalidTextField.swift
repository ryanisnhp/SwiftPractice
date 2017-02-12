//
//  InvalidTextField.swift
//  TextFieldInvalid
//
//  Created by Lam Le Van on 2/12/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

//It looks like @IBInspectable supports only these types :
//
//Int
//CGFloat
//Double
//String
//Bool
//CGPoint
//CGSize
//CGRect
//UIColor
//UIImage

enum TextType: Int {
    case hiragana = 0
    case text = 1
    case number = 2
    
    var value: String {
        switch self {
        case .hiragana: return "[]"
        case .text: return "[]"
        case .number: return "[]"
        }
    }
}

class InvalidTextField: UITextField {
    
    var textType = TextType.hiragana

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configTextField(with range: NSRange, string: String) -> Bool {
        let newString = (self.text! as NSString).replacingCharacters(in: range, with: string)
        print(newString)
        return true
    }
}

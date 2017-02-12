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
    case hiragana
    case text
    case number
    
    var value: String {
        switch self {
        case .hiragana: return "[ぁ-ん]"
        case .text: return "[a-z0-9A-Z]"
        case .number: return "[1-9]"
        }
    }
    
    func validate(string: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: value, options: .caseInsensitive)
        let matchesNumber = regex?.numberOfMatches(in: string, options: [], range: NSRange(location: 0, length: string.length))
        if let matchesNumber = matchesNumber, matchesNumber > 0 {
            return matchesNumber == string.length
        }
        return false
    }
}

class InvalidTextField: UITextField {
    
    private var textType = TextType.hiragana

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(textType: TextType) {
        self.textType = textType
    }
    
    func configTextField(with range: NSRange, string: String) -> Bool {
        let newString = (self.text! as NSString).replacingCharacters(in: range, with: string)
        print(textType)
        return textType.validate(string: newString)
    }
}

//
//  MarkupParser.swift
//  CoreTextMagazine
//
//  Created by Lam Le Van on 1/2/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Regex {
    static let font = "(.*?)(<[^>]+>|\\Z)"
    static let color = "(?<=strokeColor=\")\\w+"
}

class MarkupParser: NSObject {
    
    var font = ""
    var color: UIColor
    var strokeColor: UIColor
    var strokeWidth: Float
    var images: [String] = []
    
    init(color: UIColor, strokeColor: UIColor, strokeWidth: Float, images: [String]) {
        self.font = "Arial"
        self.color = color
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
        self.images = images
    }
    
    func attrStringFromMarkup(markup: String) -> NSAttributedString {
        let aString = NSMutableAttributedString(string: "")
        let regex = try? NSRegularExpression(pattern: Regex.font, options: [NSRegularExpression.Options.caseInsensitive, .useUnixLineSeparators])
        let chunks = regex?.matches(in: markup, options: [], range: NSMakeRange(0, markup.length))
        if let chunks = chunks {
            for b in chunks {
                let parts = (markup as NSString).substring(with: b.range).components(separatedBy: "<")
                let fontRef = CTFontCreateWithName(font as CFString, 24.0, nil)
                //apply the current text style
                let attrs: [CFString: Any] = [
                    kCTForegroundColorAttributeName: color.cgColor,
                    kCTFontAttributeName: fontRef,
                    kCTStrokeColorAttributeName: strokeColor,
                    kCTStrokeWidthAttributeName: strokeWidth
                ]
                aString.append(NSAttributedString(string: parts[0], attributes: attrs as [String : Any]?))
                
                //handle new formatting tag //3
                if parts.count > 1 {
                    let tag = parts[1]
                    if tag.hasPrefix("font") {
                        //stroke color
                        let scolorRegex = try? NSRegularExpression(pattern: Regex.color, options: [])
                        scolorRegex?.enumerateMatches(in: tag, options: [], range: NSMakeRange(0, tag.length), using: { (match, flags, stop) in
                            if let range = match?.range {
                                if (tag as NSString).substring(with: range) == "none" {
                                    self.strokeWidth = 0.0
                                }
                            }
                        })
                    }
                }
            }
        }
        
    }
}

// MARK: Conform CFString is hashable
extension CFString: Hashable {
    public var hashValue: Int {
        return self.hashValue
    }
}

public func ==(lhs: CFString, rhs: CFString) -> Bool { // Cast CFString to String is to prevent endless
    return (lhs as String) == (rhs as String)
}


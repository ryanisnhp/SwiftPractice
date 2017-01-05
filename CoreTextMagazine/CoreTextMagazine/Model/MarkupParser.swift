//
//  MarkupParser.swift
//  CoreTextMagazine
//
//  Created by Lam Le Van on 1/2/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit
import SwiftyJSON

//Callbacks
var ascentCallback = { (ref: [String: Any]) -> CGFloat in
    if let height = ref["height"] as? NSString {
        return CGFloat(height.floatValue)
    }
    return 0
}


struct Regex {
    static let font = "(.*?)(<[^>]+>|\\Z)"
    static let strokeColor = "(?<=strokeColor=\")\\w+"
    static let color = "(?<=color=\")\\w+"
    static let face = "(?<=face=\")[^\"]+"
    static let width = "(?<=width=\")[^\"]+"
    static let height = "(?<=height=\")[^\"]+"
    static let src = "(?<=height=\")[^\"]+"
}

class MarkupParser: NSObject {
    
    var font = ""
    var color: UIColor
    var strokeColor: UIColor
    var strokeWidth: Float
    var images: [[String: Any]] = []
    
    init(color: UIColor, strokeColor: UIColor, strokeWidth: Float, images: [[String: Any]]) {
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
                        let scolorRegex = try? NSRegularExpression(pattern: Regex.strokeColor, options: [])
                        scolorRegex?.enumerateMatches(in: tag, options: [], range: NSMakeRange(0, tag.length), using: { [unowned self] (match, flags, stop) in
                            if let range = match?.range {
                                if (tag as NSString).substring(with: range) == "none" {
                                    self.strokeWidth = 0.0
                                } else {
                                    self.strokeWidth = -3.0
                                    let colorSel: Selector = NSSelectorFromString("\((tag as NSString).substring(with: range))Color")
                                    self.color = UIColor.perform(colorSel)
                                }
                            }
                        })
                        
                        //color
                        let colorRegex = try? NSRegularExpression(pattern: Regex.color, options: NSRegularExpression.Options.caseInsensitive)
                        colorRegex?.enumerateMatches(in: tag, options: [], range: NSMakeRange(0, tag.length), using: { [unowned self] (match, flags, stop) in
                            if let range = match?.range {
                                let colorSel: Selector = NSSelectorFromString("\((tag as NSString).substring(with: range))Color")
                                self.color = UIColor.perform(colorSel)
                            }
                        })
                        
                        //face
                        let faceRegex = try? NSRegularExpression(pattern: Regex.face, options: [])
                        faceRegex?.enumerateMatches(in: tag, options: [], range: NSMakeRange(0, tag.length), using: { (match, flags, stop) in
                            if let range = match?.range {
                                self.font = (tag as NSString).substring(with: range)
                            }
                        })
                        if tag.hasPrefix("img") {
                            var width: NSNumber = NSNumber(integerLiteral: 0)
                            var height: NSNumber = NSNumber(integerLiteral: 0)
                            var fileName = ""
                            let widthRegex = try? NSRegularExpression(pattern: Regex.width, options: [])
                            widthRegex?.enumerateMatches(in: tag, options: [], range: NSMakeRange(0, tag.length), using: { [unowned self] (match, flags, stop) in
                                if let range = match?.range {
                                    width = NSNumber(integerLiteral: (tag as NSString).substring(with: range).intValue)
                                }
                            })
                            
                            //height
                            let heightRegex = try? NSRegularExpression(pattern: Regex.height, options: [])
                            heightRegex?.enumerateMatches(in: tag, options: [], range: NSMakeRange(0, tag.length), using: { (match, flags, stop) in
                                if let range = match?.range {
                                    height = NSNumber(integerLiteral: (tag as NSString).substring(with: range).intValue)
                                }
                            })
                            
                            //image
                            let srcRegex = try? NSRegularExpression(pattern: Regex.src, options: [])
                            srcRegex?.enumerateMatches(in: tag, options: [], range: NSMakeRange(0, tag.length), using: { (match, flags, stop) in
                                if let range = match?.range {
                                    fileName = (tag as NSString).substring(with: range)
                                }
                            })
                            
                            //add the image for drawing
                            let dict: [String: Any] = [
                                "width": width,
                                "height": height,
                                "fileName": fileName,
                                "location": NSNumber(integerLiteral: aString.length)
                            ]
                            self.images.append(dict)
                            
                            //render empty space for drawing the image in the text
                            let callbacks: CTRunDelegateCallbacks
                            callbacks.version = kCTRunDelegateVersion1
                            callbacks.getAscent = ascentCallback
                        }
                    }
                }
            }
        }
        
    }
}


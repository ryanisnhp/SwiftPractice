//
//  ViewController.swift
//  CoreTextDemo
//
//  Created by Lam Le Van on 12/20/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        typeSettingSimpleParagraph()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func typeSettingSimpleParagraph() {
        //Initiaize a graphics context in iOS
        let context = UIGraphicsGetCurrentContext()
    
        //Flip the context coordinates, in iOS only
        if let context = context {
            context.translateBy(x: 0, y: view.bounds.size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            
            
            // Initializing a graphic context in OS X is different
            // CGContextRef context
            // (CGContextRef) [[NSGraphicsContext currentContext] graphicsPort]
            
            // Set the text matrix
            context.textMatrix = CGAffineTransform.identity
            
            // Create a path which bounds the area where you will be drawing text
            // The path need not be rectangular
            let path: CGMutablePath = CGMutablePath()
            
            // In this simple example, initialize a rectangular path
            let bounds: CGRect = CGRect(x: 10.0, y: 10.0, width: 200.0, height: 200.0)
            path.addRect(bounds)
            
            
            // Initialize a string
            let textString = "Hello, World! I know nothing in the world that has as much power as a word. Sometimes I write one, and I look at it, until it begins to shine."
            // Create a mutable attributed string with a max length of 0
            //the max length is a hint as to how much internal storage to reserve
            // O means no hint
            let attrString = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0)
            
            // Copy the textString into the newly created attrString
            CFAttributedStringReplaceString(attrString, CFRange(location: 0, length: 0), textString as CFString)
            
            // Create a color that will be added as an attributed to the attrString.
            let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
            let components: [CGFloat] = [1.0, 0.0, 0.0, 0.8]
            let red = CGColor(colorSpace: rgbColorSpace, components: components)
            
            // Set the color of the first 12 chars to red
            CFAttributedStringSetAttribute(attrString, CFRange(location: 0, length: 12), kCTForegroundColorAttributeName, red)
            
            // Create the framesetter with the attributed string.
            let framesetter = CTFramesetterCreateWithAttributedString(attrString!)
            
            // Create a frame
            let frame = CTFramesetterCreateFrame(framesetter, CFRange(location: 0, length: 0), path, nil)
            CTFrameDraw(frame, context)
        }
    }
    
    private func typeSettingSimpleTextLabel(string: CFString, font: CTFont, context: CGContext) {
        
        // Initialize the string, font, and context
        let keys: [CFString] = [kCTFontAttributeName]
        let values = [font]
        

    }
}

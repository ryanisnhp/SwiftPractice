//
//  MenuView.swift
//  SweetStuffMenu
//
//  Created by Lam Le Van on 9/17/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class MenuLayer: CALayer {
    
    @IBOutlet weak var imageView: UIImageView!
    private var menu: Menu
    
    enum Menu {
        case Cookies
        case CupCakes
        case Fruits
        case IceCream
        
        private var items: [Menu: String] {
            return [
                Cookies: "COOKIES",
                CupCakes: "CUPCAKES",
                Fruits: "FRUITS",
                IceCream: "ICE CREAM"
            ]
        }
        
        private var colors: [Menu: UIColor] {
            return [
                Cookies: Colors.blueColor,
                CupCakes: Colors.greenColor,
                Fruits: Colors.yellowColor,
                IceCream: Colors.redColor
            ]
        }
        
        var item: String? {
            return items[self]
        }
        
        var color: UIColor? {
            return colors[self]
        }
    }
    
    init(menu: Menu) {
        self.menu = menu
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        self.backgroundColor = menu.color?.CGColor
    }
}

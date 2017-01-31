//
//  BoardGameManager.swift
//  CreationPattern
//
//  Created by Lam Le Van on 1/27/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import Foundation

class BoardGameManager {
    
    static let sharedInstance = BoardGameManager()
    
    init() {
        print("SingleTon initialized")
    }
    
    deinit {
        print("SingleTon is deinit")
    }
}

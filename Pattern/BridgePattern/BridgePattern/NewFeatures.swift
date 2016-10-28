//
//  NewFeatures.swift
//  BridgePattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class PriorityMessage: ClearMessage {
    
    override var contentToSend: String {
        return "Important: \(super.contentToSend)"
    }
}
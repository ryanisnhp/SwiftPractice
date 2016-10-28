//
//  Message.swift
//  BridgePattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

protocol Message {
    init(message: String)
    func prepareMessage()
    var contentToSend: String {get}
}

class ClearMessage: Message {
    
    private var message: String
    
    required init(message: String) {
        self.message = message
    }
    
    func prepareMessage() {
        //
    }
    
    var contentToSend: String {
        return message
    }
}

class EncryptedMessage: Message {
    
    private var clearText: String
    private var cipherText: String?
    
    required init(message: String) {
        self.clearText = message
    }
    
    func prepareMessage() {
        cipherText = String(clearText.characters.reverse())
    }
    
    var contentToSend: String {
        return cipherText!
    }
}




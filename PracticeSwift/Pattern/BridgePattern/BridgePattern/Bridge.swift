//
//  Bridge.swift
//  BridgePattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class CommunicatorBridge: Communicator {
    
    private var channel: Channel
    
    override init(channel: Channel.Channels) {
        self.channel = Channel.getChannel(channel)
    }
    
    func send(message: String) {
        let msg = ClearMessage(message: message)
        sendMessage(msg)
    }
    
    func sendEncryptedMessage(encryptedText: String) {
        let msg = EncryptedMessage(message: encryptedText)
        sendMessage(msg)
    }
    
    func sendPriority(message: String) {
        sendMessage(PriorityMessage(message: message))
    }
    
    private func sendMessage(msg: Message) {
        msg.prepareMessage()
        channel.sendMessage(msg)
    }
}
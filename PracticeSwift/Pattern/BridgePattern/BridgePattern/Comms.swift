//
//  Comms.swift
//  BridgePattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

//protocol ClearMessageChannel {
//    func send(message: String)
//}
//
//protocol SecureMessageChannel {
//    func sendEncryptedMessage(encryptedText: String)
//}
//
//protocol PriorityMessageChannel {
//    func sendPriority(message: String)
//}

class Communicator {
    
//    private let clearChannel: ClearMessageChannel
//    private let secureChannel: SecureMessageChannel
//    private let priorityChannel: PriorityMessageChannel
    private let channel: Channel
    init(channel: Channel.Channels) {
        self.channel = Channel.getChannel(channel)
    }
    
    private func sendMesage(msg: Message) {
        msg.prepareMessage()
        channel.sendMessage(msg)
    }
    
    func sendCleartextMessage(message: String) {
        self.sendMesage(ClearMessage(message: message))
    }
    
    func sendSecureMessage(message: String) {
        self.sendMesage(EncryptedMessage(message: message))
    }
    
    func sendPriorityMessage(message: String) {
        self.sendMesage(PriorityMessage(message: message))
    }
    
//    init(clearChannel: ClearMessageChannel, secureChannel: SecureMessageChannel, priorityChannel: PriorityMessageChannel) {
//        self.clearChannel = clearChannel
//        self.secureChannel = secureChannel
//        self.priorityChannel = priorityChannel
//    }
//    
//    func sendCleartextMessage(message: String) {
//        self.clearChannel.send(message)
//    }
//    
//    func sendSecureMessage(message: String) {
//        self.secureChannel.sendEncryptedMessage(message)
//    }
//    
//    func sendPriorityMessage(message: String) {
//        self.priorityChannel.sendPriority(message)
//    }
    
}
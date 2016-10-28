//
//  Channels.swift
//  BridgePattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

class Channel {
    
    enum Channels {
        case LandLine
        case Wireless
        case Satellite
    }
    
    class func getChannel(channelType: Channels) -> Channel {
        switch channelType {
        case .LandLine:
            return LandLineChannel()
        case .Wireless:
            return WirelessChannel()
        case .Satellite:
            return SatelliteChannel()
        }
    }
    
    func sendMessage(msg: Message) {
        fatalError("Not implemented")
    }
}

class LandLineChannel: Channel {
    override func sendMessage(msg: Message) {
        print("LandLine: \(msg.contentToSend)")
    }
}

class WirelessChannel: Channel {
    override func sendMessage(msg: Message) {
        print("Wireless: \(msg.contentToSend)")
    }
}

//class SecureWireLess: SecureMessageChannel {
//    func sendEncryptedMessage(message: String) {
//        print("Secure Wireless: \(message)")
//    }
//}

class SatelliteChannel: Channel {
    
    override func sendMessage(msg: Message) {
        print("Satelline: \(msg.contentToSend)")
    }
}

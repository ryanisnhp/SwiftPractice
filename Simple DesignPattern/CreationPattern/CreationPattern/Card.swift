//
//  Card.swift
//  CreationPattern
//
//  Created by Lam Le Van on 1/27/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

protocol Card: CustomDebugStringConvertible {
    var name: String? {get set}
    var attack: Int? {get set}
    var defense: Int? {get set}
    var mana: Int? {get set}
    func clone() -> Card
    var debugDescription: String { get }
}

enum CardType {
    case facelessManipulator, raidLeader
}

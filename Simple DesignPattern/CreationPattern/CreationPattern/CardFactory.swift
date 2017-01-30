//
//  CardFactory.swift
//  CreationPattern
//
//  Created by Lam Le Van on 1/27/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class CardFactory {
    class func createCard(cardType: CardType) -> Card? {
        switch cardType {
        case .facelessManipulator:
            return FacelessManipulatorCard()
        case .raidLeader:
            return RaidLeaderCard()
        }
    }
}

class FacelessManipulatorCard: AbstractCard {
    
    override init() {
        super.init()
        self._mana = 3
        self._attack = 2
        self._defense = 2
        self._name = "Raid Leader"
    }
}

class RaidLeaderCard: AbstractCard {
    override init() {
        super.init()
        self._mana = 5
        self._attack = 3
        self._defense = 3
        self._name = "Faceless Manipulator"
    }
}

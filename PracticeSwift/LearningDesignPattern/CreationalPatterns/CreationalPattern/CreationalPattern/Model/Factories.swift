//
//  Factories.swift
//  CreationalPattern
//
//  Created by Lam Le Van on 8/13/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation
import UIKit

protocol IWatchBand {
    var color: UIColor {get set}
    var size: BandSize {get set}
    var type: BandType {get set}
    init(size: BandSize)
    
}

protocol IWatchDial {
    var material: MaterialType {get set}
    var size: WatchSize {get set}
    init(size: WatchSize)
}

// Enums
enum MaterialType: String {
    case Aluminium = "Aluminium"
    case StainlessSteel = "Stainless Steel"
    case Gold = "Gold"
}

enum BandType: String {
    case Milanese = "Milanese"
    case Classic = "Classic"
    case Leather = "Leather"
    case Modern = "Modern"
    case LinkBracelet = "LinkBracelet"
    case SportBand = "SportBand"
}

enum WatchSize: String {
    case _38mm = "38mm"
    case _42mm = "42mm"
}

enum BandSize: String {
    case SM = "SM"
    case ML = "ML"
}

//Prepare our Bands components
class MilaneseBand: IWatchBand {
    
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.Milanese
    required init(size: BandSize) {
        self.size = size
    }
}

class Classic: IWatchBand {
    
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.Classic
    required init(size: BandSize) {
        self.size = size
    }
}

class Leather: IWatchBand {
    
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.Leather
    required init(size: BandSize) {
        self.size = size
    }
}

class Modern: IWatchBand {
    
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.Modern
    required init(size: BandSize) {
        self.size = size
    }
}

class LinkBracelet: IWatchBand {
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.LinkBracelet
    required init(size: BandSize) {
        self.size = size
    }
}

class SportBand: IWatchBand {
    
    var color = UIColor.yellowColor()
    var size: BandSize
    var type = BandType.SportBand
    required init(size: BandSize) {
        self.size = size
    }
}

class AluminiumDial: IWatchDial {
    var material = MaterialType.Aluminium
    var size: WatchSize
    required init(size: WatchSize) {
        self.size = size
    }
}

class StainlessSteelDieal: IWatchDial {
    var material = MaterialType.StainlessSteel
    var size: WatchSize
    required init(size: WatchSize) {
        self.size = size
    }
}

class GoldDial: IWatchDial {
    var material = MaterialType.Gold
    var size: WatchSize
    required init(size: WatchSize) {
        self.size = size
    }
}

//Our AbstractFactory
class WatchFactory {
    
    func createBand(bandType: BandType) -> IWatchBand {
        fatalError("not implemented")
    }
    
    func createDial(materialType: MaterialType) -> IWatchDial {
        fatalError("not imlemented")
    }
    
    final class func getFactory(size: WatchSize) -> WatchFactory? {
        var factory: WatchFactory?
        switch size {
        case ._38mm:
            factory = Watch38mmFactory()
        case ._42mm:
            factory = Watch42mmFactory()
        }
        return factory
    }
}

//Concrete Factory 1 for 42 mm
class Watch42mmFactory: WatchFactory {
    
    override func createBand(bandType: BandType) -> IWatchBand {
        switch bandType {
        case .Milanese:
            return MilaneseBand(size: .ML)
        case .Classic:
            return Classic(size: .ML)
        case .Leather:
            return Leather(size: .ML)
        case .LinkBracelet:
            return LinkBracelet(size: .ML)
        case .Modern:
            return Modern(size: .ML)
        case .SportBand:
            return SportBand(size: .ML)
        }
    }
    
    override func createDial(materialType: MaterialType) -> IWatchDial {
        switch materialType {
        case .Gold:
            return GoldDial(size: WatchSize._42mm)
        case .StainlessSteel:
            return StainlessSteelDieal(size: ._42mm)
        case .Aluminium:
            return AluminiumDial(size: WatchSize._42mm)
        }
    }
}

//Concrete Factory 2 for 38mm
class Watch38mmFactory: WatchFactory {
    override func createBand(bandType: BandType) -> IWatchBand {
        switch bandType {
        case .Milanese:
            return MilaneseBand(size: BandSize.SM)
        case .Classic:
            return Classic(size: BandSize.SM)
        case .Leather:
            return Leather(size: BandSize.SM)
        case .LinkBracelet:
            return LinkBracelet(size: BandSize.SM)
        case .Modern:
            return Modern(size: BandSize.SM)
        case .SportBand:
            return SportBand(size: BandSize.SM)
        }
    }
    
    override func createDial(materialType: MaterialType) -> IWatchDial {
        switch materialType {
        case .Gold:
            return GoldDial(size: WatchSize._38mm)
        case .StainlessSteel:
            return StainlessSteelDieal(size: WatchSize._38mm)
        case .Aluminium:
            return AluminiumDial(size: WatchSize._38mm)
        }
    }
}


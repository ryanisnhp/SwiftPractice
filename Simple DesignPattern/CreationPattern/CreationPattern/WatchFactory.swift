//
//  WatchFactory.swift
//  CreationPattern
//
//  Created by Lam Le Van on 1/27/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

//Our interface
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

enum MaterialType: String {
    case aluminium = "Aluminium"
    case stainlessSteel = "Stainless Steel"
    case gold = "Gold"
}

enum BandType: String {
    case milanese = "Milanese"
    case classic = "Classic"
    case leather = "Leather"
    case modern = "Modern"
    case linkBracelet = "LinkBracelet"
    case sportBand = "SportBand"
}

enum WatchSize: String {
    case _38mm = "38m"
    case _42mm = "42mm"
}

enum BandSize: String {
    case sm = "SM"
    case ml = "ml"
}

class MilaneseBand: IWatchBand {
    
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.milanese
    required init(size: BandSize) {
        self.size = size
    }
}

class Classic: IWatchBand {
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.classic
    required init(size: BandSize) {
        self.size = size
    }
}

class Leather: IWatchBand {
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.leather
    required init(size: BandSize) {
        self.size = size
    }
}

class Modern: IWatchBand {
    
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.modern
    required init(size: BandSize) {
        self.size = size
    }
}

class LinkBracelet: IWatchBand {
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.linkBracelet
    required init(size: BandSize) {
        self.size = size
    }
}

class SportBand: IWatchBand {
    var color = UIColor.yellow
    var size: BandSize
    var type = BandType.sportBand
    required init(size: BandSize) {
        self.size = size
    }
}

//Dials
class AluminiumDial: IWatchDial {
    
    var size: WatchSize
    var material = MaterialType.aluminium
    required init(size: WatchSize) {
        self.size = size
    }
}

class StainlessSteelDial: IWatchDial {
    var size: WatchSize
    var material = MaterialType.stainlessSteel
    required init(size: WatchSize) {
        self.size = size
    }
}

class GoldDial: IWatchDial {
    var size: WatchSize
    var material = MaterialType.gold
    required init(size: WatchSize) {
        self.size = size
    }
}

class WatchFactory {
    func createBand(bandType: BandType) -> IWatchBand {
        fatalError("not implemented")
    }
    
    func createDial(materialType: MaterialType) -> IWatchDial {
        fatalError("not implemented")
    }
    
    final class func getFactory(size: WatchSize) -> WatchFactory {
        switch size {
        case ._38mm:
            return Watch38mmFactory()
        case ._42mm:
            return Watch42mmFactory()
        }
    }
}

class Watch42mmFactory: WatchFactory {
    
    override func createBand(bandType: BandType) -> IWatchBand {
        switch bandType {
        case .milanese:
            return MilaneseBand(size: BandSize.ml)
        case .classic:
            return Classic(size: BandSize.ml)
        case .leather:
            return Leather(size: BandSize.ml)
        case .linkBracelet:
            return LinkBracelet(size: BandSize.ml)
        case .modern:
            return Modern(size: BandSize.ml)
        case .sportBand:
            return SportBand(size: BandSize.ml)
        }
    }
    
    override func createDial(materialType: MaterialType) -> IWatchDial {
        switch materialType {
        case .gold:
            return GoldDial(size: WatchSize._42mm)
        case .stainlessSteel:
            return StainlessSteelDial(size: WatchSize._42mm)
        case .aluminium:
            return AluminiumDial(size: WatchSize._42mm)
        }
    }
}

class Watch38mmFactory: WatchFactory {
    
    override func createBand(bandType: BandType) -> IWatchBand {
        switch bandType {
        case .milanese:
            return MilaneseBand(size: BandSize.sm)
        case .classic:
            return Classic(size: BandSize.sm)
        case .leather:
            return Leather(size: BandSize.sm)
        case .linkBracelet:
            return LinkBracelet(size: BandSize.sm)
        case .modern:
            return Modern(size: BandSize.sm)
        case .sportBand:
            return SportBand(size: BandSize.sm)
        }
    }
    
    override func createDial(materialType: MaterialType) -> IWatchDial {
        switch materialType {
        case .gold:
            return GoldDial(size: WatchSize._38mm)
        case .stainlessSteel:
            return StainlessSteelDial(size: WatchSize._38mm)
        case .aluminium:
            return AluminiumDial(size: WatchSize._38mm)
        }
    }
    
}

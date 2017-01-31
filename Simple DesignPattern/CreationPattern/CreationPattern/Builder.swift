//
//  Builder.swift
//  CreationPattern
//
//  Created by Lam Le Van on 1/30/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class AbstractWatchBuilder {
    final var watch: Watch?
    init() {
        
    }
    func buildDial() {}
    func buildBand() {}
}

class Watch {
    var band: IWatchBand?
    var dial: IWatchDial?
    typealias BuildWatchClosure = (Watch) -> Void
    init(build: BuildWatchClosure) {
        build(self)
    }
}

class BuilderGoldMilanese38mmWatch: AbstractWatchBuilder {
    override func buildBand() {
        watch?.band = SportBand(size: BandSize.ml)
    }

    override func buildDial() {
        watch?.dial = AluminiumDial(size: WatchSize._38mm)
    }
}

class BuilderGoldMilanese42mmWatch: AbstractWatchBuilder {
    
    override func buildBand() {
        watch?.band = SportBand(size: BandSize.sm)
    }
    
    override func buildDial() {
        watch?.dial = AluminiumDial(size: WatchSize._42mm)
    }
}

class Director {
    var builder: AbstractWatchBuilder?
    init() {}
    
    func buildWatch(builder: AbstractWatchBuilder) {
        builder.buildBand()
        builder.buildDial()
    }
}

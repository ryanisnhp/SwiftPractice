//
//  AdapterPattern.swift
//  StructuralPattern
//
//  Created by Lam Le Van on 2/5/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import Foundation

protocol ChargeableProtocol {
    /// This function is called to charge a mobile phone
    ///
    /// Usage:
    ///
    ///    charge(5.5)
    ///
    /// - Parameter volts: voltage needed to charge the battery
    ///
    /// - returns: Void
    func charge(volts: Double)
}

class PhonePrototype: ChargeableProtocol {
    
    /// This function is called to charge a mobile phone
    ///
    /// Usage:
    ///
    ///    charge(5.5)
    ///
    /// - Parameter volts: voltage needed to charge the battery
    ///
    /// - returns: Void
    func charge(volts: Double) {
        print("Charging our PhonePrototype")
        print("current voltage \(volts)")
    }
}

class Charger {
    
    var phone: ChargeableProtocol!
    let volts = 10.0
    
    func plugMobilePhone(phone: ChargeableProtocol) {
        self.phone = phone
        self.phone.charge(volts: volts)
    }
}

class SamsingMobilePhone {
    
    enum VoltageError: Error {
        case tooHigh
        case tooLow
    }
    
    func chargeBattery(volts: Double) throws {
        if volts > 10 {
            throw VoltageError.tooHigh
        }
        if volts < 10 {
            throw VoltageError.tooLow
        }
        print("Samsing mobile phone is charging")
        print("Current voltage \(volts)")
    }
}

class PearMobilePhone {
    enum PearVoltageError: Error {
        case noPower
        case tooLow
        case tooHigh
    }
    
    func charge(volts: Double) throws {
        guard volts > 0 else {
            throw PearVoltageError.noPower
        }
        if volts > 5.5 {
            throw PearVoltageError.tooHigh
        }
        if volts < 5.0 {
            throw PearVoltageError.tooLow
        }
    }
}

class SamsingAdapter: ChargeableProtocol {
    
    /// This function is called to charge a mobile phone
    ///
    /// Usage:
    ///
    ///    charge(5.5)
    ///
    /// - Parameter volts: voltage needed to charge the battery
    ///
    /// - returns: Void
    
    var samSingPhone: SamsingMobilePhone
    
    init(phone: SamsingMobilePhone) {
        samSingPhone = phone
    }
    
    func charge(volts: Double) {
        do {
            print("Adapter started")
            _ = try samSingPhone.chargeBattery(volts: volts)
            print("Adapter ended")
        } catch SamsingMobilePhone.VoltageError.tooHigh {
            print("Voltage is too high")
        } catch SamsingMobilePhone.VoltageError.tooLow {
            print("Voltage is too low")
        } catch {
            print("an error occured")
        }
    }
}

class PearAdapter: ChargeableProtocol {
    /// This function is called to charge a mobile phone
    ///
    /// Usage:
    ///
    ///    charge(5.5)
    ///
    /// - Parameter volts: voltage needed to charge the battery
    ///
    /// - returns: Void
    
    var pearMobilePhone: PearMobilePhone
    
    init(phone: PearMobilePhone) {
        pearMobilePhone = phone
    }
    
    func charge(volts: Double) {
        do {
            _ = try pearMobilePhone.charge(volts: 5.5)
        } catch PearMobilePhone.PearVoltageError.tooHigh {
            print("too high")
        } catch PearMobilePhone.PearVoltageError.tooLow {
            print("too low")
        } catch {
            print("an error occuured")
        }
    }
}

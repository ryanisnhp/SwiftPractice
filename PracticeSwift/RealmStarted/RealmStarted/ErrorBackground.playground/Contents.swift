//: Playground - noun: a place where people can play

import Cocoa

///Adapter pattern
protocol ChargeableProtocol {
    func charge(volts: Double)
}

class PhonePrototype: ChargeableProtocol {
    func charge(volts: Double) {
        print("Chargin our PhonePrototype")
        print("current voltage \(volts)")
    }
}

//class Charge {
//    
//    var phone: ChargeableProtocol
//    let volts = 10.0
//    init(phone: ChargeableProtocol) {
//        self.phone = phone
//    }
//    func plugMobilePhone(phone: ChargeableProtocol) {
//        print("A mobile is plugged")
//        self.phone = phone
//        self.phone.charge(volts)
//    }
//}

class SamSingMobilePhone {
    
    enum VoltageError: ErrorType {
        case TooHigh
        case TooLow
    }
    
    func chargeBattery(volts: Double) throws {
        if volts > 10 {
            throw VoltageError.TooHigh
        }
        if volts < 10 {
            throw VoltageError.TooLow
        }
    }
}

class PearMobilePhone {
    enum PearVoltageError: ErrorType {
        case NoPower
        case TooLow
        case TooHigh
    }
    
    //Accept only 5.5 volts
    func charge(volts: Double) throws {
        guard volts > 0 else {
            throw PearVoltageError.NoPower
        }
        if volts > 5.5 {
            throw PearVoltageError.TooHigh
        }
        if volts < 5.5 {
            throw PearVoltageError.TooLow
        }
    }
}

class SamSingAdapter: ChargeableProtocol {
    
    var samSingPhone: SamSingMobilePhone!
    init(phone: SamSingMobilePhone) {
        self.samSingPhone = phone
    }
    
    func charge(volts: Double) {
        do {
            print("Addapter started")
            _ = try samSingPhone.chargeBattery(volts)
            print("Adapter ended")
        } catch SamSingMobilePhone.VoltageError.TooHigh {
            print("too high")
        } catch SamSingMobilePhone.VoltageError.TooLow {
            print("too low")
        } catch {
            print("an error occured")
        }
    }
}

class PearAdapter: ChargeableProtocol {
    
    var pearMobilePhone: PearMobilePhone!
    
    init(phone: PearMobilePhone) {
        self.pearMobilePhone = phone
    }
    
    func charge(volts: Double) {
        do {
            _ = try pearMobilePhone.charge(5.5)
            print("Adapter ended")
        } catch PearMobilePhone.PearVoltageError.TooHigh {
            print("Voltage is too higt")
        } catch PearMobilePhone.PearVoltageError.TooLow {
            print("Voltage is too low")
        } catch {
            print("an error occured")
        }
    }
}
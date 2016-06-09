//: Playground - noun: a place where people can play

import UIKit

class ElectronicMoney {
    
    private var kW: Double
    static let hoDan = 60.0
    static let canbo = 90.0
    static let kinhDoanh = 200.0
    static let hoSanXuat = 450.0

    static var priceIn = 1000//VND
    static var priceOut = 2000//VND
    init(kW: Double) {
        self.kW = kW
    }
    
    private func giaNgoai(soChu: Double) -> Double {
        return Double(ElectronicMoney.priceOut) * (self.kW > soChu ? self.kW - soChu : 0.0)

    }
    
    private func giaTrong(soChu: Double) -> Double {
        return Double(ElectronicMoney.priceIn) * (self.kW > soChu ? soChu : self.kW)
    }
    
    private func soTien(soChu: Double) -> Double {
        return giaTrong(soChu) + giaTrong(soChu)
    }
    
    private func result() -> String {
        return "Hodan: \(soTien(ElectronicMoney.hoDan)),\n Can Bo: \(soTien(ElectronicMoney.canbo)),\n Kinh Doanh: \(soTien(ElectronicMoney.kinhDoanh)), \nHo San Xuat: \(soTien(ElectronicMoney.hoSanXuat))"
    }
}

let money = ElectronicMoney(kW: 100)
money.result()
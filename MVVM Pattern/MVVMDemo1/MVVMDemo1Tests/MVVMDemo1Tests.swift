//
//  MVVMDemo1Tests.swift
//  MVVMDemo1Tests
//
//  Created by LeVanLam on 2/15/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import XCTest
@testable import MVVMDemo1

class MVVMDemo1Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCarViewModelWithFerrariF12() {
        let ferrariF12 = Car(model: "F12", make: "Ferrari", kilowatts: 739, photoURL: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let ferrariF12ViewModel = CarViewModel(car: ferrariF12)
        XCTAssertEqual(ferrariF12ViewModel.makeText, ferrariF12.make)
        XCTAssertEqual(ferrariF12ViewModel.modelText, ferrariF12.model)
        XCTAssertEqual(ferrariF12ViewModel.horsepowerText, "\(Int(round(Double(ferrariF12.kilowatts) * CarViewModel.horsePowerKilowatt))) HP")
        XCTAssertEqual(ferrariF12ViewModel.titleText, "\(ferrariF12.make) \(ferrariF12.model)")
        XCTAssertEqual(ferrariF12ViewModel.photoURL, URL(string: ferrariF12.photoURL))
    }

}

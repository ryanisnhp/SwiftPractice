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
        let ferrariF12 = Car(model: "F12", make: "Ferrari", horsepower: 730, photoURL: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let ferrariViewModel = CarViewModel(car: ferrariF12)
        XCTAssertEqual(ferrariViewModel.modelText, "F12")
        XCTAssertEqual(ferrariViewModel.makeText, "Ferrari")
        XCTAssertEqual(ferrariViewModel.horsepowerText, "730HP")
        XCTAssertEqual(ferrariViewModel.photoURL, ferrariF12.photoURL)
        XCTAssertEqual(ferrariViewModel.titleText, "Ferrari F12")
    }
}

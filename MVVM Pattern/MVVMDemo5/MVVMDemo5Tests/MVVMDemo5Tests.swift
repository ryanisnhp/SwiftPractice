//
//  MVVMDemo5Tests.swift
//  MVVMDemo5Tests
//
//  Created by Le Van Lam on 3/5/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import XCTest
@testable import MVVMDemo5

class MVVMDemo5Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testArticleViewModel() {
        let article = Article(title: "Vanlam", body: "abcde", date: Date(), thumbnail: "google.com.vn")
        let articelViewModel = ArticleViewModel(article: article)
        XCTAssertEqual(article.title, articelViewModel.title)
        XCTAssertEqual(article.body, articelViewModel.body)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        XCTAssertEqual(dateFormatter.string(from: article.date), articelViewModel.date)
    }
    
}

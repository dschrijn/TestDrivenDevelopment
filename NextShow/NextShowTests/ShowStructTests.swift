//
//  ShowStructTests.swift
//  NextShowTests
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import XCTest
@testable import NextShow

class ShowStructTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_SetShowTitle() {
        let show = Show(title: "Fall Blockbuster")
        XCTAssertEqual(show.title, "Fall Blockbuster")
    }
    
    func testInit_SetShowTitleandReleaseDate() {
        let show = Show(title: "Action Comedy", releaseDate: "11/16/2017")
        XCTAssertEqual(show.releaseDate, "11/16/2017")
    }
    
}

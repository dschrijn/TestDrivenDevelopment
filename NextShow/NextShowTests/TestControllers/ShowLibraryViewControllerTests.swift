//
//  ShowLibraryViewControllerTests.swift
//  NextShowTests
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import XCTest

@testable import NextShow

class ShowLibraryViewControllerTests: XCTestCase {
    
    var sut: ShowLibraryViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ShowLibraryVC") as! ShowLibraryViewController
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShowLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.showTableView)
        
    }
    
    func testViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.showTableView.dataSource)
        XCTAssertNotNil(sut.showTableView.dataSource is ShowLibraryDataService)
    }
    
    func testViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.showTableView.delegate)
        XCTAssertNotNil(sut.showTableView.delegate is ShowLibraryDataService)
    }
    
    func testViewDidLoad_SetsTableViewDelegateAndDataSourceToSameOjbect() {
        XCTAssertEqual(sut.showTableView.dataSource as! ShowLibraryDataService, sut.showTableView.delegate as! ShowLibraryDataService)
    }
    
}

//
//  ShowCellTests.swift
//  NextShowTests
//
//  Created by David A. Schrijn on 10/12/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import XCTest

@testable import NextShow

class ShowCellTests: XCTestCase {
    
    var tableView: UITableView!
    var dataSource: MockCellDataSource!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showLibraryVC = storyboard.instantiateViewController(withIdentifier: "ShowLibraryVC") as! ShowLibraryViewController
        _ = showLibraryVC.view
        
        tableView =  showLibraryVC.showTableView
        dataSource = MockCellDataSource()
        tableView.dataSource = dataSource
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCellConfig_ShouldSetLabelsToShowData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCellID", for: IndexPath(row: 0, section: 0)) as! ShowCell
        
        cell.configShowCell(withShow: Show(title: "Action", releaseDate: "11/03/17"))
        XCTAssertEqual(cell.textLabel?.text, "Action")
        XCTAssertEqual(cell.detailTextLabel?.text, "11/03/17")
    }
    
}

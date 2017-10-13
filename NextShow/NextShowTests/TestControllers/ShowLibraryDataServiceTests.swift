//
//  ShowLibraryDataServiceTests.swift
//  NextShowTests
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import XCTest
@testable import NextShow

class ShowLibraryDataServiceTests: XCTestCase {
    
    var sut: ShowLibraryDataService!
    var tableView: UITableView!
    var showLibraryVC: ShowLibraryViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        sut = ShowLibraryDataService()
        sut.showManager = ShowManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        showLibraryVC = storyboard.instantiateViewController(withIdentifier: "ShowLibraryVC") as! ShowLibraryViewController
        _ = showLibraryVC.view
        
        tableView = showLibraryVC.showTableView
        tableView.dataSource = sut
        tableView.delegate = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTableViewSectionCount_ShouldBeTwo() {
        let sectionCount = tableView.numberOfSections
        XCTAssertEqual(sectionCount, 2)
    }
    
    func testRowCountInSectionOne_ShouldEqualShowsToSeeCount() {
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 5)

    }
    
    func testRowCount_ShouldEqualShowsSeenCount() {

        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 0)
    }
    
    func testCellForAtRowIndex_ShouldReturnShowCell() {
        sut.showManager?.addShowToLibrary(show: Show(title: "Horror"))
        
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ShowCell)
        
    }
        
    func testCell_ShouldDequeueCell() {
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = sut
        
        
        sut.showManager?.addShowToLibrary(show: Show(title: "SyFy"))
        tableViewMock.reloadData()
        
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCellConfig_ShouldSetCellData() {
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = sut
        
        let show = Show(title: "Action")
        sut.showManager?.addShowToLibrary(show: show)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! ShowCellMock
        
        XCTAssertEqual(cell.show, show)
        
    }
    
    func testSectionTwoCellConfig_ShouldSetCellWithFavoritedShow() {
        let tableViewMock = TableViewMock.initializeTableViewMock()
        tableViewMock.dataSource = sut
        
        let showOne = Show(title: "Action")
        let showTwo = Show(title: "Comedy")
        
        sut.showManager?.addShowToLibrary(show: showOne)
        sut.showManager?.addShowToLibrary(show: showTwo)
        
        sut.showManager?.favoriteShowAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! ShowCellMock
        XCTAssertEqual(cell.show, showOne)
    }
    
    func testFavoritingAShow_ShouldFavoriteShowOnCellSelect() {
        sut.showManager?.addShowToLibrary(show: Show(title: "Bio"))
        sut.showManager?.addShowToLibrary(show: Show(title: "Action"))
        
        tableView.delegate?.tableView!(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.showManager?.showsToSeeCount, 1)
        XCTAssertEqual(sut.showManager?.showsSeenCount, 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectValues() {
        let sectionOneTitle = tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: 0)
        let sectionTwoTitle = tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(sectionOneTitle, "Shows To See")
        XCTAssertEqual(sectionTwoTitle, "Shows Seen")
    }
        
        
        
    
    
}








//
//  ShowManagerTests.swift
//  NextShowTests
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import XCTest

@testable import NextShow

class ShowManagerTests: XCTestCase {
    //System Under Test
    var sut: ShowManager!
    
    override func setUp() {
        super.setUp()
        sut = ShowManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShowsToSeeCount_ReturnsZero() {
        
        XCTAssertEqual(sut.showsToSeeCount, 0)
    }
    
    func testShowsSeen_ReturnsZero() {

        XCTAssertEqual(sut.showsSeenCount, 0)
    }
    
    func testShowsToSeeCount_ShouldBeOneAfterShowAdded() {
        sut.addShowToLibrary(show: Show(title: "SyFy Action"))
        XCTAssertEqual(sut.showsToSeeCount, 1)
    }
    
    func testShowAtIndexReturnsLastAddedShow() {
        let show = Show(title: "Action")
        sut.addShowToLibrary(show: show)
        
        let returnedShowAtIndex = sut.showAtIndex(index: 0)
        XCTAssertEqual(show.title, returnedShowAtIndex.title)
    }
    
    func testFavoriteShow_updatesShowSeenAndShowsToSeeCounts() {
        sut.addShowToLibrary(show: Show(title: "Action Adventure"))
        sut.favoriteShowAtIndex(index: 0)
        XCTAssertEqual(sut.showsToSeeCount, 0)
        XCTAssertEqual(sut.showsSeenCount, 1)
    }
    
    func testFavoriteShow_ShouldRemoveShowFromShowsToSeeArray() {
        let showOne = Show(title: "Action Adventure")
        let showTwo = Show(title: "Documentary")
        
        sut.addShowToLibrary(show: showOne)
        sut.addShowToLibrary(show: showTwo)
        sut.favoriteShowAtIndex(index: 0)
        
        XCTAssertEqual(sut.showAtIndex(index: 0).title, showTwo.title)
    }
    
    func testFavoriteShowAtIndex_ShouldReturnFavoritedShow() {
        let show = Show(title: "Horror")
        sut.addShowToLibrary(show: show)
        sut.favoriteShowAtIndex(index: 0)
        let returnedShow = sut.favoritedShowAtIndex(index: 0)
        XCTAssertEqual(show.title, returnedShow.title)
    }
    
    func testClearAllArrayItems_ShouldClearAllArrayItems() {
        sut.addShowToLibrary(show: Show(title: "Action"))
        sut.addShowToLibrary(show: Show(title: "Horror"))
        sut.favoriteShowAtIndex(index: 0)
        
        XCTAssertEqual(sut.showsToSeeCount, 1)
        XCTAssertEqual(sut.showsSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.showsToSeeCount, 0)
        XCTAssertEqual(sut.showsSeenCount, 0)
    }
    
    
    
    
    
    
    
}

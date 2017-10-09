//
//  BrainTests.swift
//  FizzBuzzTests
//
//  Created by David A. Schrijn on 10/8/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import XCTest

@testable import FizzBuzz


class BrainTests: XCTestCase {
    
    // MARK: - Variables
    
    let brain = Brain()
    
    // MARK: - Setup/TearDown
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testIsDivisibleByThree() {
        let result = brain.isDivisibleByThree(number: 3)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByOne() {
        let result = brain.isDivisibleByThree(number: 1)
        XCTAssertEqual(result, false)
    }
    
    func testIsDivisibleByFive() {
        let result = brain.isDivisibleByFive(number: 5)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByFive() {
        let result = brain.isDivisibleByFive(number: 1)
        XCTAssertEqual(result, false)
    }
    
    func testIsDivisibleByFifteen() {
        let result = brain.isDivisibleByFifteen(number: 15)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByFifteen() {
        let result = brain.isDivisibleByFifteen(number: 1)
        XCTAssertEqual(result, false)
    }
    
    func testSaysFizz() {
        let result = brain.check(number: 3)
        XCTAssertEqual(result, Move.Fizz )
    }
    
    func testSayBuzz() {
        let result = brain.check(number: 5)
        XCTAssertEqual(result, Move.Buzz)
    }
    
    func testSaysFizzBuzz() {
        let result = brain.check(number: 15)
        XCTAssertEqual(result, Move.FizzBuzz)
    }
    
    func testSayNmber() {
        let result = brain.check(number: 1)
        XCTAssertEqual(result, Move.Number)
    }
    
}

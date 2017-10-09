//
//  ViewControllerUnitTests.swift
//  FizzBuzzTests
//
//  Created by David A. Schrijn on 10/8/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import XCTest

@testable import FizzBuzz

class ViewControllerUnitTests: XCTestCase {
    
    // MARK: - Variables
    
    var viewController: ViewController!
    
    // MARK: Setup/TearDown
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        UIApplication.shared.keyWindow?.rootViewController = viewController
        
        let _  = viewController.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test() {
        viewController.play(move: .Number)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 1)
    }
    
    func testMove2IncrementScore() {
        viewController.play(move: .Number)
        viewController.play(move: .Number)
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 2)
    }
    
    func testHasAGame() {
        XCTAssertNotNil(viewController.game)
    }
    
    func testFizzIncrementScore() {
        viewController.game?.score = 2
        viewController.play(move: .Fizz)
        let score = viewController.gameScore
        XCTAssertEqual(score, 3)
    }
    
    func testBuzzIncrementScore() {
        viewController.game?.score = 4
        viewController.play(move: .Buzz)
        let score = viewController.gameScore
        XCTAssertEqual(score, 5)
    }
    
    func testFizzBuzzIncrementScore() {
        viewController.game?.score = 14
        viewController.play(move: .FizzBuzz)
        let score = viewController.gameScore
        XCTAssertEqual(score, 15)
    }
    
    func testIncorrectNumber() {
        viewController.game?.score = 1
        viewController.play(move: .Number)
        let score = viewController.gameScore
        XCTAssertEqual(score, 2)
    }
    
    func testOnWrongMoveScoreNotIncremented() {
        viewController.play(move: .Fizz)
        let score = viewController.gameScore
        XCTAssertEqual(score, 0)
    }
    
    
    
}

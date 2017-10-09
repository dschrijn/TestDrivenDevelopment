//
//  GameTests.swift
//  FizzBuzzTests
//
//  Created by David A. Schrijn on 10/8/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import XCTest

@testable import FizzBuzz

class GameTests: XCTestCase {
    
    // MARK: - Variables
    
    let game = Game()
    
    // MARK: - Setup/TearDown
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testGameStartsAtZero() {
        XCTAssertTrue(game.score == 0)
    }
    
    func testOnPlayScoreIncremented() {
        let _ = game.play(move: .Number )
        XCTAssertTrue(game.score == 1)
    }
    
    func testOnplayTwiceScoreIncremented() {
        game.score = 1
        let _ = game.play(move: .Number)
        XCTAssertTrue(game.score == 2)
    }
    
    func testIfMoveIsWrong() {
        game.score = 1
        let response = game.play(move: .Fizz)
        let result = response.right
        XCTAssertEqual(result, false)
    }
    
    func testIfMoveIsBuzz() {
        game.score = 4
        let response = game.play(move: .Buzz)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testIfMoveIsNotBuzz() {
        game.score = 1
        let response = game.play(move: .Buzz)
        let result = response.right
        XCTAssertEqual(result, false)
    }
    
    func testIfMoveIsFizzBuzz() {
        game.score = 14
        let response = game.play(move: .FizzBuzz)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testIfMoveIsNotFizzBuzz() {
        game.score = 1
        let response = game.play(move: .FizzBuzz)
        let result = response.right
        XCTAssertEqual(result, false)
    }
    
    func testIsNumber() {
        game.score = 1
        let response = game.play(move: .Number)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testIsNotNumber() {
        game.score = 2
        let response = game.play(move: .Number)
        let result = response.right
        XCTAssertEqual(result, false)
    }
    
    func testIfScoreIsWrongNotIncrement() {
        game.score = 1
        let _ = game.play(move: .Fizz)
        XCTAssertEqual(game.score, 1)
    }
    
    func testPlayShouldReturnIfMoveRIght() {
        let response = game.play(move: .Number)
        XCTAssertNotNil(response.right)
    }
    
    func testPlayShouldReturnNewScore() {
        let response = game.play(move: .Number)
        XCTAssertNotNil(response.score)
    }
    
    
}

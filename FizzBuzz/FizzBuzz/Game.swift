//
//  Game.swift
//  FizzBuzz
//
//  Created by David A. Schrijn on 10/8/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import Foundation

class Game {
    
    // MARK: - Variables
    
    var score: Int
    let brain: Brain
    
    // MARK: - Functions
    
    func play(move: Move) -> (right: Bool, score: Int) {
        
        let result = brain.check(number: score + 1)
        
        if result == move {
            score += 1
            return (true, score)
        } else {
            return (false, score)
        }
        
    }
    
    init() {
        score = 0
        brain = Brain()
    }
}

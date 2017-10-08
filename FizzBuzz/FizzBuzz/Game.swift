//
//  Game.swift
//  FizzBuzz
//
//  Created by David A. Schrijn on 10/8/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import Foundation

class Game {
    
    var score: Int
    
    let brain: Brain
    
    func play(move: String) -> Bool {
        score += 1
        
        let result = brain.check(number: score)
        
        if result == move {
            return true
        } else {
            return false
        }
        
    }
    
    init() {
        score = 0
        brain = Brain()
    }
}

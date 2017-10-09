//
//  Brain.swift
//  FizzBuzz
//
//  Created by David A. Schrijn on 10/8/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import Foundation

class Brain {
    
    // MARK: - Functions
    
    func isDivisibleBy(divisor: Int, number: Int) -> Bool {
        return number % divisor == 0
    }
    
    func isDivisibleByThree(number: Int) -> Bool {
        return isDivisibleBy(divisor: 3, number: number)    }
    
    func isDivisibleByFive(number: Int) -> Bool {
        return isDivisibleBy(divisor: 5, number: number)
    }
    
    func isDivisibleByFifteen(number: Int) -> Bool {
        return isDivisibleBy(divisor: 15, number: number)
    }
    
    func check(number: Int) -> Move {
        switch true {
        case isDivisibleByFifteen(number: number):
            return Move.FizzBuzz
        case isDivisibleByThree(number: number):
            return Move.Fizz
        case isDivisibleByFive(number: number):
            return Move.Buzz
        default:
            return Move.Number
        }
    }
    
    
    
}

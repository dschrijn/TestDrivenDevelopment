//
//  ViewController.swift
//  FizzBuzz
//
//  Created by David A. Schrijn on 10/8/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    var game: Game?
    var gameScore: Int? {
        didSet {
            guard let unwrappedScore = gameScore else { return }
            numberButton.setTitle("\(unwrappedScore)", for: .normal)
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var fizzButton: UIButton!
    @IBOutlet weak var buzzButton: UIButton!
    @IBOutlet weak var fizzBuzzButton: UIButton!
    
    // MARK: - VieDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game()
        guard let newGame = game else { return }
        gameScore = newGame.score
    }

    // MARK: - IBActions
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender {
        case numberButton:
            play(move: .Number)
        case fizzButton:
            play(move: .Fizz)
        case buzzButton:
            play(move: .Buzz)
        case fizzBuzzButton:
            play(move: .FizzBuzz)
        default:
            print("Invalid selection")
        }
    }
    
    // MARK: - Functions
    
    func play(move: Move) {
        
        guard let unwrappedGame = game else {
            print("Game is Nil")
            return
        }
        let response = unwrappedGame.play(move: move)
        gameScore = response.score
    }


}


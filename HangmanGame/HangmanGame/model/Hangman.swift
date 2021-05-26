//
//  Hangman.swift
//  HangmanGame
//
//  Created by user198256 on 5/25/21.
//

import Foundation

import Foundation

class Hangman: NSObject {
    var word: String
    var hint: String
    var wordLetters: [Character]
    var foundLetters: [Character]
    var guessedLetters: [Character] = Array()
    var retries = 10
    var isGameOver = false
    var gameStatus = "Running"
    
    init(word: String, hint: String) {
        self.word = word
        self.hint = hint
        self.wordLetters = Array(word)
        self.foundLetters = self.wordLetters.map({ (_) -> Character in
            return "_"
        })
    }
    
    func guessLetter(guess: Character) {
        if (isGuessValid(guess: guess)) {
            self.updateFoundLetters(guess: guess)
        } else {
            self.handleGuessNotFound(guess: guess)
            
        }
        
        
        self.checkGameOverConditions()
    }
    
    func isGuessValid(guess: Character) -> Bool {
        return self.wordLetters.contains(guess) &&
            !self.guessedLetters.contains(guess) &&
            !self.isGameOver
    }
    
    func checkGameOverConditions() {
        if (self.retries <= 0) {
            self.gameStatus = "Perdeu"
            self.isGameOver = true
        } else if (!self.foundLetters.contains("_")) {
            self.gameStatus = "Ganhou"
            self.isGameOver = true
        }
    }
    
    func handleGuessNotFound(guess: Character) {
        if (self.retries
                > 0 && !self.isGameOver) {
            self.retries
                -= 1
        }
        self.guessedLetters.append(guess)
    }
    
    func updateFoundLetters(guess: Character) {
        for (index, letter) in self.wordLetters.enumerated() {
            if (letter == guess) {
                foundLetters[index] = letter
            }
        }
    }
    
    override var description: String {
        return "- Word:           \(self.word)" +
            "\n- Word Letters:      \(self.wordLetters)" +
            "\n- Guessed Letters:   \(self.guessedLetters)" +
            "\n- Found Letters:     \(self.foundLetters)" +
            "\n- Remaining Guesses: \(self.retries)" +
            "\n- Game Over:         \(self.isGameOver)"
    }
}

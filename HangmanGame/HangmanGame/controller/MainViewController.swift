//
//  ViewController.swift
//  HangmanGame
//
//  Created by user198256 on 5/25/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var lbHint: UILabel!
    @IBOutlet weak var lbTotalLetters: UILabel!
    @IBOutlet weak var lbGuessedLetters: UILabel!
    @IBOutlet weak var lbRemaining: UILabel!
    @IBOutlet weak var lbLabel: UILabel!
    @IBOutlet weak var tfGuess: UITextField!
    var hangmanGame: Hangman!
    
    
    @IBAction func guess(_ sender: Any) {
        let letter = Character(self.tfGuess.text!)
        self.hangmanGame.guessLetter(guess: letter)
        self.tfGuess.text = ""
        self.updateGame()
        
        if (self.hangmanGame.isGameOver) {
            let rvc = self.storyboard?.instantiateViewController(identifier: "view_resultado") as! ResultViewController
            rvc.result = self.hangmanGame.gameStatus
            self.present(rvc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        self.hangmanGame = Hangman(word: "teste", hint: "teste")
        self.updateGame()
        
    }
    
    func updateGame() {
        self.lbHint.text = self.hangmanGame.hint
        self.lbTotalLetters.text = "A palavra possui \(self.hangmanGame.word.count) letras"
        self.lbGuessedLetters.text = String(self.hangmanGame.guessedLetters)
        self.lbRemaining.text = "Tentativas: \(self.hangmanGame.retries)"
        self.lbLabel.text = String(self.hangmanGame.foundLetters)
    }
    
}


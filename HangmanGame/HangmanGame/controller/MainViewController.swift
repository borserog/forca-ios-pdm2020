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
    @IBOutlet weak var ivGallows: UIImageView!
    var hangmanGame: Hangman!
    var gameWords = [["gabriel", "meu nome"],
                     ["manga", "uma fruta"],
                     ["porsche", "um carro"],
                     ["zagreb", "uma cidade"],
                     ["parque", "um lugar"]]
    
    
    @IBAction func guess(_ sender: Any) {
        let letter = Character(self.tfGuess.text!)
        self.hangmanGame.guessLetter(guess: letter)
        self.tfGuess.text = ""
        self.updateGame()
        
        if (self.hangmanGame.isGameOver) {
            let rvc = self.storyboard?.instantiateViewController(identifier: "view_resultado") as! ResultViewController
            rvc.result = self.hangmanGame.gameStatus
            self.present(rvc, animated: true, completion: nil)
            self.newGame()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
        self.newGame()
    }
        
    func newGame() {
        let randomIndex = Int.random(in: 0..<gameWords.count)
        self.hangmanGame = Hangman(word: gameWords[randomIndex][0], hint: gameWords[randomIndex][1])
        self.updateGame()
    }
    
    func updateGame() {
        self.lbHint.text = "DICA: \(self.hangmanGame.hint)"
        self.lbTotalLetters.text = "A palavra possui \(self.hangmanGame.word.count) letras"
        self.lbGuessedLetters.text = "LETRAS TENTADAS: \(String(self.hangmanGame.guessedLetters))"
        self.lbRemaining.text = "Tentativas: \(self.hangmanGame.retries)"
        self.lbLabel.text = String(self.hangmanGame.foundLetters)
        self.ivGallows.image = UIImage(named: "hg_\(self.hangmanGame.retries).png")
    }
    
}


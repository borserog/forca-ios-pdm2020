//
//  ResultViewController.swift
//  HangmanGame
//
//  Created by user198256 on 5/25/21.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var lbResultado: UILabel!
    var result: String?
    
    @IBAction func `return`(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)	
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.lbResultado.text = self.result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

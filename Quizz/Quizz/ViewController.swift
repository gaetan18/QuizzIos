//
//  ViewController.swift
//  Quizz
//
//  Created by Developer on 27/06/2018.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var joueur1TF: UITextField!
    @IBOutlet weak var joueur2TF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //todo ajouter un test de non nullité des nom de joueurs
        let player1 = Player(name:joueur1TF.text!)
        let player2 = Player(name:joueur2TF.text!)
        
        var array = [Player]()
        array.append(player1)
        array.append(player2)
        
        
        guard let destination = segue.destination as? QuestionViewController else { return }
        destination.players = array
    }
    
}
class Player {
    var name: String = ""
    var nbAnswer: Int = 0
    var nbCorrectAnswer: Int = 0
    var score: Int = 0
    init(name : String) {
        self.name = name
    }
    
}


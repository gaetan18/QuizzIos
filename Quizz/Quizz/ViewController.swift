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
    @IBOutlet weak var joueur3TF: UITextField!
    @IBOutlet weak var joueur4TF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var playerNames:[String] = [String]()
        
        if(!(joueur1TF.text?.isEmpty)!){
            playerNames.append(joueur1TF.text!)
        }
        
        if(!(joueur2TF.text?.isEmpty)!){
            playerNames.append(joueur2TF.text!)
        }
        
        if(!(joueur3TF.text?.isEmpty)!){
            playerNames.append(joueur3TF.text!)
        }
        
        if(!(joueur4TF.text?.isEmpty)!){
            playerNames.append(joueur4TF.text!)
        }
        
        if(playerNames.count<2){
            let alert = UIAlertController(title: "Ah non, c'est pas possible", message: "Il faut au minimum deux utilisateurs pour faire un battle !", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var array = [Player]()
        for name in playerNames {
              let player = Player(name:name)
            array.append(player)
        }
        
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


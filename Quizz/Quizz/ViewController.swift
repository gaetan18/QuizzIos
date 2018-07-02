//
//  ViewController.swift
//  Quizz
//
//  Created by Developer on 27/06/2018.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var joueur1: UITextField!
    @IBOutlet weak var joueur2: UITextField!
    @IBOutlet weak var joueur3: UITextField!
    @IBOutlet weak var joueur4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let Namesjoueurs = Joueurs(joueur1: joueur1.text!, joueur2: joueur2.text!, joueur3: joueur3.text!, joueur4: joueur4.text!)
        
            guard let destination = segue.destination as? QuestionViewController else { return }
            destination.Namesjoueurs = Namesjoueurs
        }

}

struct Joueurs {
    var joueur1: String
    var joueur2: String
    var joueur3: String
    var joueur4: String
}

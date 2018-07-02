//
//  QuestionViewController.swift
//  Quizz
//
//  Created by Developer on 02/07/2018.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var Namesjoueurs: Joueurs?
    
    @IBOutlet weak var testdisplayname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let djoueur = Namesjoueurs else { fatalError("No contact provided") }
        testdisplayname.text = djoueur.joueur1 + djoueur.joueur2 + djoueur.joueur3 + djoueur.joueur4
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

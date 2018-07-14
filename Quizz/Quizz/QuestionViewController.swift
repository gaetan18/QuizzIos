//
//  QuestionViewController.swift
//  Quizz
//
//  Created by Developer on 02/07/2018.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    
    var players = [Player]()
    var q1 = Question(question:"",answers:[])
    
    struct Question {
        var question: String
        var answers: Array<Player>
    }
    struct Answer {
        var proposal: String
        var isAnswer: Bool
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        q1 = Question(question:"Qui est Arnold ?",answers:[])
        //On configure pour le premier joueur et la première question
        playerName.text = players[0].name
        configure(getRandomQuestion())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configure(_ question:Question){
        questionLabel.text = question.question
        answerButton1.setTitle( "Un chat", for: [])
        answerButton2.setTitle( "Un reloud", for: [])
        answerButton3.setTitle( "Une biche", for: [])
        answerButton4.setTitle( "Un langage", for: [])
    }
    func getRandomQuestion() -> Question {
        return q1
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

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
    
    var questions: Array<Question> = [Question]()
    
    var players : [Player]!
    var currentQuestion : Question!
    var currentAnswer : String!
    var currentPlayer : Player!
    var nbQuestions : Int = 3
    
    struct Question {
        var question: String
        var answers: Array<Answer>
    }
    struct Answer {
        var proposal: String
        var isAnswer: Bool
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //On lance l'algo du jeu
        initQuestions()
        launchGame()
    }
    
    func launchGame(){
        print("dans launch")
        //On parcours la liste des jours et on prend le premier qui doit répondre à une question
        for player in players {
            print("dans player")
            if(player.nbAnswer<nbQuestions){
                currentPlayer = player
                playerName.text = currentPlayer.name
                configure(getRandomQuestion())
                return
            }
        }
        performSegue(withIdentifier: "sgShowResults", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func button1(_ sender: UIButton) {
        let button : UIButton = sender as! UIButton
        if(button.titleLabel!.text == currentAnswer){
            currentPlayer.nbCorrectAnswer = currentPlayer.nbCorrectAnswer + 1
        }
        print("1 :")
        currentPlayer.nbAnswer = currentPlayer.nbAnswer + 1
        print(currentPlayer.nbAnswer)
        print(currentPlayer.nbCorrectAnswer)
        launchGame()
    }
    @IBAction func button2(_ sender: UIButton) {
        let button : UIButton = sender as! UIButton
        if(button.titleLabel!.text == currentAnswer){
            currentPlayer.nbCorrectAnswer = currentPlayer.nbCorrectAnswer + 1
        }
        print("2 :")
        currentPlayer.nbAnswer = currentPlayer.nbAnswer + 1
        print(currentPlayer.nbAnswer)
        print(currentPlayer.nbCorrectAnswer)
        launchGame()
    }
    @IBAction func button3(_ sender: UIButton) {
        let button : UIButton = sender as! UIButton
        if(button.titleLabel!.text == currentAnswer){
            currentPlayer.nbCorrectAnswer = currentPlayer.nbCorrectAnswer + 1
        }
        print("3 :")
        currentPlayer.nbAnswer = currentPlayer.nbAnswer + 1
        print(currentPlayer.nbAnswer)
        print(currentPlayer.nbCorrectAnswer)
        launchGame()
    }
    @IBAction func button4(_ sender: UIButton) {
        let button : UIButton = sender as! UIButton
        if(button.titleLabel!.text == currentAnswer){
            currentPlayer.nbCorrectAnswer = currentPlayer.nbCorrectAnswer + 1
        }
        print("4 :")
        currentPlayer.nbAnswer = currentPlayer.nbAnswer + 1
        print(currentPlayer.nbAnswer)
        print(currentPlayer.nbCorrectAnswer)
        launchGame()
    }
    
    func configure(_ question:Question){
        questionLabel.text = question.question
        
        answerButton1.setTitle( question.answers[0].proposal, for: [])
        answerButton2.setTitle( question.answers[1].proposal, for: [])
        answerButton3.setTitle( question.answers[2].proposal, for: [])
        answerButton4.setTitle( question.answers[3].proposal, for: [])
        
        for answer in question.answers {
            if(answer.isAnswer == true){
                currentAnswer = answer.proposal
            }
        }
        
        currentQuestion = question
    }
    func initQuestions(){
        
        //1
        let answer1:Answer! = Answer(proposal:"Dynamite",isAnswer:true)
        let answer2:Answer! = Answer(proposal:"Electricité",isAnswer:false)
        let answer3:Answer! = Answer(proposal:"Vélo",isAnswer:false)
        let answer4:Answer! = Answer(proposal:"Internet",isAnswer:false)
        
        var array:[Answer]! = [Answer]()
        array.append(answer1)
        array.append(answer2)
        array.append(answer3)
        array.append(answer4)
        
        let question : Question  = Question(question:"Laquelle de ces inventions a été crée en premier ?", answers:array)
        
        //2
        let answer1_2:Answer! = Answer(proposal:"1832",isAnswer:true)
        let answer2_2:Answer! = Answer(proposal:"1958",isAnswer:false)
        let answer3_2:Answer! = Answer(proposal:"1962",isAnswer:false)
        let answer4_2:Answer! = Answer(proposal:"1998",isAnswer:false)
        
        var array2:[Answer]! = [Answer]()
        array2.append(answer1_2)
        array2.append(answer2_2)
        array2.append(answer3_2)
        array2.append(answer4_2)
        
        let question2 : Question  = Question(question:"Le suffrage universel pour l'élection du Président de la République date de ?", answers:array2)
        
        //3
        let answer1_3:Answer! = Answer(proposal:"cotation assidue en continu ",isAnswer:true)
        let answer2_3:Answer! = Answer(proposal:"ca ced",isAnswer:false)
        let answer3_3:Answer! = Answer(proposal:"biche",isAnswer:false)
        let answer4_3:Answer! = Answer(proposal:"langage",isAnswer:false)
        
        var array3:[Answer]! = [Answer]()
        array3.append(answer1_3)
        array3.append(answer2_3)
        array3.append(answer3_3)
        array3.append(answer4_3)
        
        let question3 : Question  = Question(question:"Dans l'expression CAC 40 que veut dire l'abréviation CAC ?", answers:array3)

        questions.append(question)
        questions.append(question2)
        questions.append(question3)
    }
    func generateRandomNumber(min: Int, max: Int) -> Int {
        let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
        return randomNum
    }
    
    func getRandomQuestion() -> Question {
        
        let number = generateRandomNumber(min:0,max:(questions.count-1))
       
        return questions[number]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ResultsViewController else { return }
        destination.players = players
    }
    
}

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
        let answer1_3:Answer! = Answer(proposal:"cotation assidue en continu",isAnswer:true)
        let answer2_3:Answer! = Answer(proposal:"ca ced",isAnswer:false)
        let answer3_3:Answer! = Answer(proposal:"biche",isAnswer:false)
        let answer4_3:Answer! = Answer(proposal:"langage",isAnswer:false)
        
        var array3:[Answer]! = [Answer]()
        array3.append(answer1_3)
        array3.append(answer2_3)
        array3.append(answer3_3)
        array3.append(answer4_3)
        
        let question3 : Question  = Question(question:"Dans l'expression CAC 40 que veut dire l'abréviation CAC ?", answers:array3)
        
        //4
        let answer1_4:Answer! = Answer(proposal:"Charente-Maritime",isAnswer:true)
        let answer2_4:Answer! = Answer(proposal:"Poitou-Charente",isAnswer:false)
        let answer3_4:Answer! = Answer(proposal:"Limousin",isAnswer:false)
        let answer4_4:Answer! = Answer(proposal:"Val-de-Marne",isAnswer:false)
        
        var array4:[Answer]! = [Answer]()
        array4.append(answer1_4)
        array4.append(answer2_4)
        array4.append(answer3_4)
        array4.append(answer4_4)
        
        let question4 : Question  = Question(question:"Quel conseil régional Ségolène Royal a-t-elle présidé ?", answers:array4)

        //5
        let answer1_5:Answer! = Answer(proposal:"Nirvana",isAnswer:false)
        let answer2_5:Answer! = Answer(proposal:"U2",isAnswer:false)
        let answer3_5:Answer! = Answer(proposal:"The Doors",isAnswer:true)
        let answer4_5:Answer! = Answer(proposal:"2b3",isAnswer:false)
        
        var array5:[Answer]! = [Answer]()
        array5.append(answer1_5)
        array5.append(answer2_5)
        array5.append(answer3_5)
        array5.append(answer4_5)
        
        let question5 : Question  = Question(question:"De quel groupe Jim Morrison était-il le chanteur ?", answers:array5)
        
        //6
        let answer1_6:Answer! = Answer(proposal:"8",isAnswer:false)
        let answer2_6:Answer! = Answer(proposal:"4",isAnswer:true)
        let answer3_6:Answer! = Answer(proposal:"9",isAnswer:false)
        let answer4_6:Answer! = Answer(proposal:"2",isAnswer:false)
        
        var array6:[Answer]! = [Answer]()
        array6.append(answer1_6)
        array6.append(answer2_6)
        array6.append(answer3_6)
        array6.append(answer4_6)
        
        let question6 : Question  = Question(question:"En géométrie, combien de côtés possède un losange ?", answers:array6)
        
        //7
        let answer1_7:Answer! = Answer(proposal:"Le Titanic",isAnswer:false)
        let answer2_7:Answer! = Answer(proposal:"La Méduse",isAnswer:true)
        let answer3_7:Answer! = Answer(proposal:"Le Poisson",isAnswer:false)
        let answer4_7:Answer! = Answer(proposal:"Le rainbow warrior",isAnswer:false)
        
        var array7:[Answer]! = [Answer]()
        array7.append(answer1_7)
        array7.append(answer2_7)
        array7.append(answer3_7)
        array7.append(answer4_7)
        
        let question7 : Question  = Question(question:"Quel nom porte le bateau dont Théodore Géricault peint le radeau ?", answers:array7)
        
        questions.append(question)
        questions.append(question2)
        questions.append(question3)
        questions.append(question4)
        questions.append(question5)
        questions.append(question6)
        questions.append(question7)

        //8
        let answer1_8:Answer! = Answer(proposal:"Le Maroc",isAnswer:false)
        let answer2_8:Answer! = Answer(proposal:"La Suisse",isAnswer:false)
        let answer3_8:Answer! = Answer(proposal:"Le Japon",isAnswer:false)
        let answer4_8:Answer! = Answer(proposal:"L'Albanie",isAnswer:true)
        
        var array8:[Answer]! = [Answer]()
        array8.append(answer1_8)
        array8.append(answer2_8)
        array8.append(answer3_8)
        array8.append(answer4_8)
        
        let question8 : Question  = Question(question:"De quel pays Tirana est-elle la capitale ?", answers:array8)
        
        //9
        let answer1_9:Answer! = Answer(proposal:"FO",isAnswer:true)
        let answer2_9:Answer! = Answer(proposal:"SUD",isAnswer:false)
        let answer3_9:Answer! = Answer(proposal:"CGT",isAnswer:false)
        let answer4_9:Answer! = Answer(proposal:"MEDEF",isAnswer:false)
        
        var array9:[Answer]! = [Answer]()
        array9.append(answer1_9)
        array9.append(answer2_9)
        array9.append(answer3_9)
        array9.append(answer4_9)
        
        let question9 : Question  = Question(question:"Quel syndicat a été dirigé par Marc Blondel ?", answers:array9)
        
        //10
        let answer1_10:Answer! = Answer(proposal:"La chèvre",isAnswer:true)
        let answer2_10:Answer! = Answer(proposal:"Le mouton",isAnswer:false)
        let answer3_10:Answer! = Answer(proposal:"La vache",isAnswer:false)
        let answer4_10:Answer! = Answer(proposal:"Le chat",isAnswer:false)
        
        var array10:[Answer]! = [Answer]()
        array10.append(answer1_10)
        array10.append(answer2_10)
        array10.append(answer3_10)
        array10.append(answer4_10)
        
        let question10 : Question  = Question(question:"Avec la laine de quel animal fait-on des vêtements en cachemire ?", answers:array10)
        
        questions.append(question)
        questions.append(question2)
        questions.append(question3)
        questions.append(question4)
        questions.append(question5)
        questions.append(question6)
        questions.append(question7)
        questions.append(question8)
        questions.append(question9)
        questions.append(question10)
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

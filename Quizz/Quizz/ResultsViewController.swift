import UIKit

class ResultsViewController: UIViewController {
    
    var players : [Player]!
    var winnerPlayers : [Player] = [Player]()
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultPlayer1: UILabel!
    @IBOutlet weak var resultPlayer2: UILabel!
    @IBOutlet weak var resultPlayer3: UILabel!
    @IBOutlet weak var resultPlayer4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                winnerPlayers.append(players[0])
                checkWinners()
                publishWinner()
                displayDetailResults()
    }
    
    func checkWinners(){
        for player in players {
            if(player.nbCorrectAnswer > winnerPlayers[0].nbCorrectAnswer){
                winnerPlayers = [Player]()
                winnerPlayers.append(player)
            } else if(player.nbCorrectAnswer == winnerPlayers[0].nbCorrectAnswer){
                if(!winnerPlayers.contains(where: {$0 === player})){
                    winnerPlayers.append(player)
                }
            }
        }
    }
    
    func publishWinner(){
        if(winnerPlayers.count>1){
            var winnersName:String  = ""
            for winner in winnerPlayers {
                winnersName+=winner.name+" "
            }
            resultLabel.text = "\(winnersName) gagnent !"
        } else {
            resultLabel.text = "\(winnerPlayers[0].name) gagne !"
        }
    }
    
    func displayDetailResults(){
        resultPlayer4.isHidden = true
        resultPlayer3.isHidden = true

        if(players.count>3){
            resultPlayer4.isHidden = false
            resultPlayer4.text = "\(players[3].name) a un score de \(players[3].nbCorrectAnswer)"
        }
        if(players.count>2){
            resultPlayer3.isHidden = false
            resultPlayer3.text = "\(players[2].name) a un score de \(players[2].nbCorrectAnswer)"
        }
        if(players.count>1){
            resultPlayer2.text = "\(players[1].name) a un score de \(players[1].nbCorrectAnswer)"
        }
       
        resultPlayer1.text = "\(players[0].name) a un score de \(players[0].nbCorrectAnswer)"
    }
    
    @IBAction func reDo(_ sender: UIButton) {
         performSegue(withIdentifier: "sgMenu", sender: nil)
    }
}

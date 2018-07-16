import UIKit

class ResultsViewController: UIViewController {
    
    var players : [Player]!
    var winnerPlayer : Player!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultPlayer1: UILabel!
    @IBOutlet weak var resultPlayer2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerPlayer = players[0]
        for player in players {
            if(player.nbCorrectAnswer > winnerPlayer.nbCorrectAnswer){
                winnerPlayer = player
            }
        }
        if(players[0].nbCorrectAnswer == players[1].nbCorrectAnswer){
            resultLabel.text = "Vous gagnez tout les deux !"
        } else {
            resultLabel.text = "\(winnerPlayer.name) gagne !"
        }
        resultPlayer1.text = "\(players[0].name) a un score de \(players[0].nbCorrectAnswer)"
        resultPlayer2.text = "\(players[1].name) a un score de \(players[1].nbCorrectAnswer)"
    }
    @IBAction func reDo(_ sender: UIButton) {
         performSegue(withIdentifier: "sgMenu", sender: nil)
    }
}

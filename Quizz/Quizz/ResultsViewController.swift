import UIKit

class ResultsViewController: UIViewController {
    
    var players : [Player]!
    var winnerPlayer : Player!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerPlayer = players[0]
        for player in players {
            if(player.nbCorrectAnswer > winnerPlayer.nbCorrectAnswer){
                winnerPlayer = player
            }
            resultLabel.text = "\(winnerPlayer.name) gagne avec un total de \(winnerPlayer.nbCorrectAnswer) !"
        }
    }
}
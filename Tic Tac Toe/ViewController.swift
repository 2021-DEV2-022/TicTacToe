import UIKit

class ViewController: UIViewController {
 
    @IBOutlet private weak var button0: UIButton!
    @IBOutlet private weak var button1: UIButton!
    @IBOutlet private weak var button2: UIButton!
    @IBOutlet private weak var button3: UIButton!
    @IBOutlet private weak var button4: UIButton!
    @IBOutlet private weak var button5: UIButton!
    @IBOutlet private weak var button6: UIButton!
    @IBOutlet private weak var button7: UIButton!
    @IBOutlet private weak var button8: UIButton!
    @IBOutlet private weak var currentPlayerLabel: UILabel!
    
    private var gridButtons: [UIButton] = []
    private var game: Game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridButtons.append(button0)
        gridButtons.append(button1)
        gridButtons.append(button2)
        gridButtons.append(button3)
        gridButtons.append(button4)
        gridButtons.append(button5)
        gridButtons.append(button6)
        gridButtons.append(button7)
        gridButtons.append(button8)
        startNewGame()
    }
    
    @IBAction private func newGameHandle(_ sender: Any) {
        startNewGame()
    }
    
    @IBAction private func gridButtonHandle(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        button.setImage(UIImage(named: game.currentPlayer.rawValue), for: .disabled)
        button.isEnabled = false
        game.cellSelected(position: button.tag)
        updateLabelCurrentPlayer()
    }
}

extension ViewController: GameDelegate {
    func gameOver() {
        var message = "The game is a draw"
        if game.winner == Player.player1 {
            message = "Player 1 wins"
        } else if game.winner == Player.player2 {
            message = "Player 2 wins"
        }
        let gameOverAlertView = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        gameOverAlertView.addAction(UIAlertAction(title: "New Game", style: .default, handler: { [weak self] _ in
            self?.startNewGame()
        }))
        self.present(gameOverAlertView, animated: true, completion: nil)
    }
}

private extension ViewController {
    func startNewGame() {
        for button in gridButtons {
            button.isEnabled = true
        }
        game = Game()
        game.delegate = self
        updateLabelCurrentPlayer()
    }
    
    func updateLabelCurrentPlayer() {
        if game.currentPlayer == .player1 {
            currentPlayerLabel.text = "Player 1 - Cross"
            currentPlayerLabel.textColor = .blue
        } else {
            currentPlayerLabel.text = "Player 2 - Circle"
            currentPlayerLabel.textColor = .red
        }
    }
}


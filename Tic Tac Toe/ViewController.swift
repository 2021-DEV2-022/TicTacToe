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
    
    private var gridButtons: [UIButton] = []
    
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
    }
    
    @IBAction private func newGameHandle(_ sender: Any) {
        startNewGame()
    }
    
    @IBAction private func gridButtonHandle(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        button.setImage(UIImage(named: "cross"), for: .disabled)
        button.isEnabled = false
    }
}

private extension ViewController {
    func startNewGame() {
        for button in gridButtons {
            button.isEnabled = true
        }
    }
}


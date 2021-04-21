import Foundation

enum Player: String {
    case player1 = "cross"
    case player2 = "circle"
}

protocol GameDelegate {
    func gameOver()
}

class Game {
    var currentPlayer: Player = .player1
    var grid: [Player?] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    var winner: Player?
    var delegate: GameDelegate?
    
    init(gridSize: Int = 3) {
        grid = []
        for _ in [Int](0..<gridSize*gridSize) {
            grid.append(nil)
        }
    }
    
    func cellSelected(position: Int) {
        if position < 0 || position >= grid.count || grid[position] != nil {
            return
        }
        grid[position] = currentPlayer
        if gameIsOver() {
            delegate?.gameOver()
        } else {
            currentPlayer = currentPlayer == .player1 ? .player2 : .player1
        }
    }
    
    func gameIsOver() -> Bool {
        if !grid.contains(nil) {
            return true
        } else if currentPlayerWin() {
            winner = currentPlayer
            return true
        }
        return false
    }
    
    func currentPlayerWin() -> Bool {
        var sequence = [Player]()
        for _ in [Int](0..<grid.gridSize()) {
            sequence.append(currentPlayer)
        }
        if grid.toLines().contains(sequence) {
            return true
        } else if grid.toColumns().contains(sequence) {
            return true
        } else if grid.toDiagonals().contains(sequence) {
            return true
        }
        return false
    }
}

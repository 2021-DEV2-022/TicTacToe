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
    
    func cellSelected(position: Int) {
        if position < 0 || position > 8 {
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
        if grid.toLines().contains([currentPlayer, currentPlayer, currentPlayer]) {
            return true
        } else if grid.toColumns().contains([currentPlayer, currentPlayer, currentPlayer]) {
            return true
        } else if grid.toDiagonals().contains([currentPlayer, currentPlayer, currentPlayer]) {
            return true
        }
        return false
    }
}

import Foundation

enum Player: String {
    case player1 = "cross"
    case player2 = "circle"
}

class Game {
    var currentPlayer: Player = .player1
    var grid: [Player?] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    
    func cellSelected(position: Int) {
        if position < 0 || position > 8 {
            return
        }
        grid[position] = currentPlayer
        currentPlayer = currentPlayer == .player1 ? .player2 : .player1
    }
}

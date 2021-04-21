import XCTest

class GameIsOver: XCTestCase {

    func testGameIsOverIfGridDoesnotHaveNilItem() throws {
        let game = Game()
        game.grid = [
            Player.player1, Player.player2, Player.player1,
            Player.player2, Player.player1, Player.player2,
            Player.player1, Player.player2, Player.player2,
        ]
        XCTAssertEqual(true, game.gameIsOver())
    }
    
    func testCurrentPlayerWinWithThreeItemsInFirstLine() throws {
        let game = Game()
        game.grid = [
            Player.player1, Player.player1, Player.player1,
            nil, nil, nil,
            nil, nil, nil,
        ]
        XCTAssertEqual(true, game.currentPlayerWin())
    }

    func testCurrentPlayerWinWithThreeItemsInSecondLine() throws {
        let game = Game()
        game.grid = [
            nil, nil, nil,
            Player.player1, Player.player1, Player.player1,
            nil, nil, nil,
        ]
        XCTAssertEqual(true, game.currentPlayerWin())
    }
    
    func testCurrentPlayerWinWithThreeItemsInThirdLine() throws {
        let game = Game()
        game.grid = [
            nil, nil, nil,
            nil, nil, nil,
            Player.player1, Player.player1, Player.player1,
        ]
        XCTAssertEqual(true, game.currentPlayerWin())
    }
    
    func testCurrentPlayerWinWithThreeItemsInFirstColomn() throws {
        let game = Game()
        game.grid = [
            Player.player1, nil, nil,
            Player.player1, nil, nil,
            Player.player1, nil, nil,
        ]
        XCTAssertEqual(true, game.currentPlayerWin())
    }

    func testCurrentPlayerWinWithThreeItemsInSecondColomn() throws {
        let game = Game()
        game.grid = [
            nil, Player.player1, nil,
            nil, Player.player1, nil,
            nil, Player.player1, nil,
        ]
        XCTAssertEqual(true, game.currentPlayerWin())
    }
    
    func testCurrentPlayerWinWithThreeItemsInThirdColomn() throws {
        let game = Game()
        game.grid = [
            nil, nil, Player.player1,
            nil, nil, Player.player1,
            nil, nil, Player.player1,
        ]
        XCTAssertEqual(true, game.currentPlayerWin())
    }

    func testWinnerIsCurrentPlayerIfHeSelectCellToWin() throws {
        let game = Game()
        game.grid = [
            nil, Player.player1, Player.player1,
            nil, nil, nil,
            nil, nil, nil,
        ]
        game.cellSelected(position: 0)
        XCTAssertEqual(Player.player1, game.winner)
    }
    
    func testCurrentPlayerWinWithThreeItemsInFirstDiagonal() throws {
        let game = Game()
        game.grid = [
            Player.player1, nil, nil,
            nil, Player.player1, nil,
            nil, nil, Player.player1,
        ]
        XCTAssertEqual(true, game.currentPlayerWin())
    }

    func testCurrentPlayerWinWithThreeItemsInSecondDiagonal() throws {
        let game = Game()
        game.grid = [
            nil, nil, Player.player1,
            nil, Player.player1, nil,
            Player.player1, nil, nil,
        ]
        game.cellSelected(position: 0)
        XCTAssertEqual(Player.player1, game.winner)
    }
    
    func testGameIsOverIfCurrentPlayerWin() throws {
        let game = Game()
        game.grid = [
            Player.player1, Player.player1, Player.player1,
            nil, nil, nil,
            nil, nil, nil,
        ]
        XCTAssertEqual(true, game.gameIsOver())
    }
    
    func testGameIsOverNobodyWonAndGridDoesnotHaveNilItem() throws {
        let game = Game()
        game.grid = [
            Player.player1, Player.player2, Player.player2,
            Player.player2, Player.player1, Player.player1,
            Player.player1, Player.player2, Player.player2,
        ]
        XCTAssertEqual(true, game.gameIsOver())
    }
    
    func testCurrentPlayerWinWithFourItemsInFirstLine() throws {
        let game = Game(gridSize: 4)
        game.grid = [
            Player.player1, Player.player1, Player.player1, Player.player1,
            nil, nil, nil, nil,
            nil, nil, nil, nil,
            nil, nil, nil, nil,
        ]
        XCTAssertEqual(true, game.currentPlayerWin())
    }
    
    func testCurrentPlayerWinWithFourItemsInFirstDiagonal() throws {
        let game = Game(gridSize: 4)
        game.grid = [
            Player.player1, nil, nil, nil,
            nil, Player.player1, nil, nil,
            nil, nil, Player.player1, nil,
            nil, nil, nil, Player.player1,
        ]
        XCTAssertEqual(true, game.currentPlayerWin())
    }
    
    func testCurrentPlayerWinWithFourItemsInFirstColomn() throws {
        let game = Game(gridSize: 4)
        game.grid[0] = Player.player1
        game.grid[4] = Player.player1
        game.grid[8] = Player.player1
        game.grid[12] = Player.player1
        XCTAssertEqual(true, game.currentPlayerWin())
    }
}

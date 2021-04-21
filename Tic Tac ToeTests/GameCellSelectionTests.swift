import XCTest

class GameCellSelectionTests: XCTestCase {

    func testNewGameHasCurrentPlayer1() throws {
        let game = Game()
        XCTAssertEqual(Player.player1, game.currentPlayer)
    }
    
    func testNewGameHasNilGrid() throws {
        let game = Game()
        XCTAssertEqual([nil, nil, nil, nil, nil, nil, nil, nil, nil], game.grid)
    }

    func testPlayerCanSelectDispnibleCell() throws {
        let game = Game()
        game.cellSelected(position: 0)
        XCTAssertEqual(Player.player1, game.grid[0])
    }

    func testPlayerSelectCorrectCellUpdateCurrentPlayer() throws {
        let game = Game()
        XCTAssertEqual(Player.player1, game.currentPlayer)
        game.cellSelected(position: 0)
        XCTAssertEqual(Player.player2, game.currentPlayer)
    }

    func testPlayerCannotSelectCellBefore0() throws {
        let game = Game()
        game.cellSelected(position: -1)
        XCTAssertEqual([nil, nil, nil, nil, nil, nil, nil, nil, nil], game.grid)
        XCTAssertEqual(Player.player1, game.currentPlayer)
    }

    func testPlayerCannotSelectCellAfter8() throws {
        let game = Game()
        game.cellSelected(position: 9)
        XCTAssertEqual([nil, nil, nil, nil, nil, nil, nil, nil, nil], game.grid)
        XCTAssertEqual(Player.player1, game.currentPlayer)
    }
    
    func testPlayerCannotSelectUsedCell() throws {
        let game = Game()
        game.grid[0] = Player.player2
        game.cellSelected(position: 0)
        XCTAssertEqual([Player.player2, nil, nil, nil, nil, nil, nil, nil, nil], game.grid)
        XCTAssertEqual(Player.player1, game.currentPlayer)
    }
}

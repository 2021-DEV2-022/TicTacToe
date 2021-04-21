import Foundation

extension Array {
    func toLines() -> [[Element]] {
        var result = [[Element]]()
        let gridSize = self.gridSize()
        for index in [Int](0..<gridSize) {
            let startIndex = index * gridSize
            let endIndex = index * gridSize + gridSize
            result.append(Array(self[startIndex ..< endIndex]))
        }
        return result
    }

    func toColumns() -> [[Element]] {
        var result = [[Element]]()
        let gridSize = self.gridSize()
        for index in [Int](0..<gridSize) {
            var rowArray = [Element]()
            for row in [Int](0..<gridSize) {
                rowArray.append(self[index + row * gridSize])
            }
            result.append(rowArray)
        }
        return result
    }
    
    func toDiagonals() -> [[Element]] {
        let gridSize = self.gridSize()
        var firstDiagonal = [Element]()
        var secondDiagonal = [Element]()
        
        for index in [Int](0..<gridSize) {
            firstDiagonal.append(self[index + index * gridSize])
            secondDiagonal.append(self[(index + 1) * gridSize - 1 - index])
        }
        return [firstDiagonal, secondDiagonal]
    }
    
    func gridSize() -> Int {
        return Int(sqrt(Double(self.count)))
    }
}

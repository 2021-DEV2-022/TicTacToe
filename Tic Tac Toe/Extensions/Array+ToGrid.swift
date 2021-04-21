import Foundation

extension Array {
    func toLines() -> [[Element]] {
        return [Array(self[0 ..< 3]), Array(self[3 ..< 6]), Array(self[6 ..< 9])]
    }

    func toColumns() -> [[Element]] {
        return [Array([self[0], self[3], self[6]]), Array([self[1], self[4], self[7]]), Array([self[2], self[5], self[8]])]
    }
    
    func toDiagonals() -> [[Element]] {
        return [Array([self[0], self[4], self[8]]), Array([self[2], self[4], self[6]])]
    }
}

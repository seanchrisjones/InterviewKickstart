//: [Previous](@previous)

import Foundation

/*
 You are given row * cols and a knight that moves like in normal chess.
 - currently knight is at starting position denoted by start_row and start_ col
 - you want to end  at position denoted by end_row/end_col
 the goal is to count the minimum number of moves it will tak to get to the end position
 
 NOTE: The night moves in an L shape: either two squares vertically and 1 square horizontally / 2 squares horizontally 1 vertically
 **/
var globalBox = [Int]()
func find_minimum_number_of_moves(row: Int, cols: Int, start_row: Int, start_col: Int, end_row: Int, end_col: Int) -> Int {
    var board = Array(repeating: Array(repeating: 0, count: cols), count: row)
    var visited = Array(repeating: Array(repeating: 0, count: cols), count: row)
    BFS(board: &board, start_row: start_row, start_col: start_col, end_row: end_row, end_col: end_col, visited: &visited)
    
    if globalBox.isEmpty {
        globalBox.append(-1)
    }
    
    return globalBox.min()!
}

func BFS(board: inout[[Int]], start_row:  Int, start_col:  Int, end_row: Int, end_col: Int, visited: inout [[Int]]) {
    
    var directions = [[2,1],[-2,1],[2,-1],[-2,-1],[1,2],[-1,2],[1,-2], [-1,-2]]
    let rows = board.count
    let cols = board[0].count
    if start_row == end_row && start_col == end_col {
        globalBox.append(0)
    }
    
    var q = [(row: Int, col: Int)]()
    q.append((row:start_row, col: start_col))
    
    
    while !q.isEmpty {
        let node = q.removeFirst()
        for direction in directions {
    
            let r = direction[0] + node.row
            let c = direction[1] + node.col
    
            if r < rows && r >= 0 && c < cols && c >= 0 {
                
                if r == end_row && c == end_col {
                    visited[r][c] = visited[node.row][node.col] + 1
                    globalBox.append(visited[r][c])
                } else {
                    if visited[r][c] == 0 {
                        visited[r][c] = visited[node.row][node.col] + 1
                        q.append((row: r, col: c))
                        
                    }
                }
                
            }
            
            
        }
    }
    
}

find_minimum_number_of_moves(row: 2, cols: 1, start_row: 1, start_col: 0, end_row: 1, end_col: 0)

//: [Next](@next)

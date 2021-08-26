//: [Previous](@previous)

import Foundation

/*
 Counting unique paths in a grid
 Given a 2D grid with m rows and n cols
 count the number of unique paths starting at the top left corner and getting to the bottom right corner
 all moves must go either right or down
 **/

func countPaths( _ m: Int, _ n: Int) -> Int {
    var table = Array(repeating: Array(repeating: 0, count: n), count: m)
    for  i in 0...n-1 {
        table[i][0] = 1
    }
    for j in 0...n-1 {
        table[0][j] = 1
    }
    for row in 1...m-1 {
        for col in 1...n-1 {
            table[row][col] = table[row-1][col] + table[row][col-1]
        }
    }
    return table[m-1][n-1]
    
}

countPaths(10,3)

//: [Next](@next)

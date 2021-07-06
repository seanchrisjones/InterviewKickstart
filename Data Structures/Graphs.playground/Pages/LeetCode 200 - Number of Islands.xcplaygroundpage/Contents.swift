//: [Previous](@previous)

import Foundation

/*
 Given a 2D map of 1's land and 0's water, count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.  You may assume all four edges of the grid are surrounded by water
 
 - for this problem creating an adjacency list will be a bit complicated, but finding the neighbors will be simpler.
 - we need to make a get neighbors function that will take the coordinates of our node and find the neighbors
 - This is the implicit representation of edges
 
 **/

func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0}
    var g = grid //  new variable so we can pass the grid
    let rowLength = grid.count // rowLength variable to store num of row
    let colLength = grid[0].count // colLength variable to store num of cols
    var islands = 0 // island count variable
    
    for r in 0..<rowLength {// for every sub array in the input array
        for c in 0..<colLength {// for every element in the sub array
            if g[r][c] == "1" {// if the element located at row[r] column[c] is a 1
                BFS(&g, r, c)// we'll perform a BFS
                g[r][c] = "0"
                islands += 1
                
            }
        }
    }
    
    return islands
    
}

func BFS(_ grid: inout [[Character]], _ row: Int, _ col: Int) {
    var q = [[Int]]()// create an array called q that stores subarrays of integers
    q.append([row,col]) // append [row,col] array to the q
    
    while !q.isEmpty { // while there are elements inside the queue
        let current = q.removeFirst() // the variable current will be creates by removing the first element of the array
        let directions = [[1,0],[-1,0],[0,1],[0,-1]] // we now create the directions right, left, up and down
        
        for direction in directions {
            let r = direction[0] + current[0]
            let c = direction[1] + current[1]
            // we'll find the neighbors of the given coordinates by adding the direction values to the given coordinates
            
            if r < grid.count && r >= 0 && c < grid[0].count && c >= 0 && grid[r][c] == "1" {
                grid[r][c] = "0"
                // if the neighboring coordinated are within the bounds of the array and the value there is a 1 (land) change it to a 0
                q.append([r,c])
                // add the coordinates of the neighboring land to the queue
            }
        }
        
        
        
    }
}
numIslands([
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ])





func getNeighbors(_ row: Int, _ col: Int, _ grid: [[Character]]) ->[(Int,Int)] {
    var neighbors = [(Int,Int)]()
    if row+1 <= grid.count-1 {
        let right: (Int, Int) = (row+1, col)
        neighbors.append(right)
        
    }
    if col+1 <= grid[0].count-1 {
        let down:(Int, Int) = (row, col+1)
        neighbors.append(down)
        
    }
    if row-1 >= 0 {
        let left: (Int,Int) = (row-1, col)
        neighbors.append(left)
        
    }
    if col-1 >= 0 {
        let up: (Int, Int) = (row, col-1)
        neighbors.append(up)
        
    }
    return neighbors
}
//: [Next](@next)

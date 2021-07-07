//: [Previous](@previous)

import Foundation

/*
 
 Given a 10x10 snakes and ladders board. find the minimum number of throws required to win the game
 - In thiis problem, we don't need to consider the numbers on the dice
 - This will not be a weighted graph
 - we want to calculate the shortest path from 0 being the source to 100, the destination
 - the number of hops we make through the graph does not necessarily corelate to the number of throws we make.
 - if a vertex has a snake or a ladder we can be going across 2 or more edges.
 **/

func snakesAndLadders(n: Int) -> Int {
    var adjList = Array(repeating: [Int](), count: n)
    for i in 0...n {
        //There are some edge cases here when we approach the end of the board we don't want to exceed 100
        // if a vertex has a ladder we don't want to include the start of the ladder just the end to relate to the number of throws
        for dice in 1...6 {
            if i+dice <= 100 {
                adjList[i].append(i+dice)
            }
            
        }
    }
    //print(adjList)
    var visited = Array(repeating: -1, count: n+1)
    var distance = Array(repeating: -1, count: n+1)
    // outer loop is not needed because the ssource is vertex 0
    // we'll call the BFS function 1 time on vertex 0
    bfs(source: 0, distance: &distance, visited: &visited, adjList: &adjList)
    return visited[100]
    
}

func bfs(source: Int, distance: inout [Int], visited: inout [Int], adjList: inout [[Int]] ) {
    var q = QueueArray<Int>()
    q.push(source)
    visited[source] = 1
    
    while !q.isEmpty {
        if let node = q.pop() {
            for neighbor in adjList[node]{
                visited[neighbor] = 1
                distance[neighbor] = 1
                q.push(neighbor)
            }
        }
    }
    
}

snakesAndLadders(n: 100 )
//: [Next](@next)

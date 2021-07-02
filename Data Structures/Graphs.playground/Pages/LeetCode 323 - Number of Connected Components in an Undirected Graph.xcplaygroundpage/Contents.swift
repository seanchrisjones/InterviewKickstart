//: [Previous](@previous)

import Foundation

/*
 Given N Nodes labeled from 0 to n-1 and a list of undirected edges ( each edge is a pair of nodes), write a function to find th number of connected components in an undirected graph
 
 // General Template for Graph problems
    -1 Build the Graph
        - we'll need to know the number of verticies and their ids ( convenient ids: 0 to n-1)
        - Adjacency list - 1 dimensional array of empty lists. Since lists don't exist in swift we'll have to use a dictionary s toring ints,Array.
            for src,dst in edges
                adjList[src].append(dst)
                adjList[dst].append(src)
    
    -2 BFS/DFS
        BFS(Source)
 
 
 
 
 
    -3 Outer Loop to explore the Graph
 **/

class Vertex {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}
var n = 9
var adjList: [Int:[Int]] = [:]
var visited = [Bool](repeating: false, count: n)
print(visited)

//: [Next](@next)

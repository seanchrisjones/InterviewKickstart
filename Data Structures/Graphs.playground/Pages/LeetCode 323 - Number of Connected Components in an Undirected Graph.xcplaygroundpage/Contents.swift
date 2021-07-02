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

struct Vertex<T> {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}
extension Vertex : Hashable where T: Hashable {}
extension Vertex : Equatable where T: Equatable {}







func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    if edges.isEmpty {return n}
    if edges.count == 1 { return n-1}
    
    var adjList = Array(repeating: [Int](), count: n)
    var visited = [Bool](repeating: false, count: n)
    
    for edge in edges {
        adjList[edge[0]].append(edge[1])
        adjList[edge[1]].append(edge[0])
    }
    
    var components = 0
    for v in 0...n-1 {
        if visited[v] == false {
            components += 1
            DFS(source: v, adjList: adjList, visited: &visited)
        }
    }
    return components
}


func BFS(source: Int, adjList: [[Int]], visited: inout [Bool]) {
    var q = QueueArray<Int>()
    q.push(source)
    visited[source] = true
    
    while !q.isEmpty {
        if let node = q.pop() {
            for neighbor in adjList[node] {
                visited[neighbor] = true
                q.push(neighbor)
            }
        }
    }
}

func DFS(source: Int, adjList:[[Int]], visited: inout [Bool]) {
    visited[source] = true
    for w in adjList[source] {
        if visited[w] == false {
            DFS(source: w, adjList: adjList, visited: &visited)
        }
    }
    
    
}

countComponents(5, [[0,1],[1,2],[2,3],[3,4]])

//: [Next](@next)

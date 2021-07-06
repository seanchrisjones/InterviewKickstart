//: [Previous](@previous)

import Foundation

/*
 Given an undirected Graph, return true if and only if it is bipartite
 
 What is a Bipartite Graph?
    - A graph is bipartite if we can split its set of nodes into two independent subsets A and B such that every edge in the graph has one node in A and another in B.
 
 To determine if a graph is bipartite, we want to detect a cycle, but just because there is a cycle it does not necessarily mean that the grpah is no bipartite.
    - if there is a cycle of even length the graph can be bipartite, but not if there is a cycle of odd length.

 what if there is no cycle?
 - the graph can form a valid tree
 - all valid trees ( a Graph in which there are no cycles) are bipartite.
 
 How can we detect the length of a cycle?
    
 
 **/


func isBipartiteGraph(graph: [[Int]]) -> Bool {
    var visited = Array(repeating: false, count: graph.count)
    var parents = Array(repeating: 0, count: graph.count)
    var distance = Array(repeating: -1, count: graph.count)
    var adjList = Array(repeating: [Int](), count: graph.count)
    
    for i in 0...graph.count-1 {
        adjList[i].append(contentsOf: graph[i])
        // In the case of this problem we do not need to create the Adjacency list. The input is the adjacency list
        
    }
    //print(adjList)
    
    for v in 0...adjList.count-1 {
        if visited[v] == false {
            if BFS(v, adjList, &visited, &parents, &distance) == false { return false}
            
        }
    }
    
   
    return true
}

//When doing a BFS to detect cycle there are two types of cross edges
// A cross edge where the vertices are on the same level of the tree will create an odd length cycle
// a cross edge where thr vertices are on adjacent levels of the tree will creat an even length cycle.


func BFS(_ source: Int, _ adjList: [[Int]], _ visited: inout [Bool],_ parents: inout [Int], _ distance: inout [Int] ) -> Bool {
    var q  = QueueArray<Int>()
    q.push(source)
    distance[source] = 0
    visited[source] = true
    while !q.isEmpty {
        if let node = q.pop() {
            for neighbor in adjList[node] {
                if visited[neighbor] == false { // tree edge
                    visited[neighbor] = true
                    distance[neighbor] = distance[node]+1
                    q.push(neighbor)
                } else { // neighbor has been visited
                    if neighbor != parents[node] {
                        if distance[neighbor] == distance[node] {
                            return false
                        }
                        
                    }
                }
            }
            
        }
    }
    return true
   
}

isBipartiteGraph(graph: [[1,2,3],[0,2],[0,1,3],[0,2]])

// When Doing DFS We're looking for Back edges
// In DFS the LVL numbers do not mean anything so we wont need distance
// Just like in BFS there will be two types of backEdges


func DFS(_ source: Int, _ adjList: [[Int]], _ visited: inout [Bool],_ parents: inout [Int] ) -> Bool{
    visited[source] = true
    for neighbor in adjList[source] {
        if visited[neighbor] == false {
            if DFS(neighbor, adjList, &visited, &parents) == true {
                return true
            }
            
        } else {
            if neighbor != parents[source] {
                // if color on neighbor == color on node
                // what do we mean by color
                return false
            }
        }
    }
return false
    
}

//: [Next](@next)

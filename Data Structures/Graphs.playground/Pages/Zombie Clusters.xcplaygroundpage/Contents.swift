//: [Previous](@previous)

import Foundation

/*
 There are zombies in Seattle. Some of them know each other directly.  Others might know each other transitively through others.  For example A<->B and B<->C know each other directly , then A and C know each other indirectly and all three belong to one cluster.  Knowing which zombies know each other directly , find the number of zombie clusters.  Input is a square matrix where each square  zombies[A][B], indicates whether zombie A knows Zombie B Directly
 
 **/



func zombieCluster( zombies: [String]) -> Int {
    
    if zombies.isEmpty {
        return 0
    }
    
    var adjList = Array(repeating: [Int](), count: zombies.count)
    var visited = [Bool](repeating: false, count: zombies.count)
    
    for i in 0...zombies.count-1 {
        for (index, char) in zombies[i].enumerated() {
            if char == "1" {
                adjList[i].append(index)
            }
        }
       
    }
    var clusters = 0
    for v in 0...zombies.count-1{
        if visited[v] == false {
            clusters += 1
            DFS(source: v, adjList: adjList, visited: &visited)
            
        }
    }
    return clusters
}

func DFS(source: Int, adjList: [[Int]], visited: inout [Bool]) {
    visited[source] = true
    for w in adjList[source] {
        if visited[w] == false {
            DFS(source: w, adjList: adjList, visited: &visited)
        }
    }
    
    
}


zombieCluster(zombies: ["1100","1110","0110","0001"])
//: [Next](@next)

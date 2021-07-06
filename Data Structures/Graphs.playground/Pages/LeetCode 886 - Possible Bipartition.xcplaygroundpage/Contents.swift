//: [Previous](@previous)

import Foundation

/*
 Given a set of N people number 1-N, we would like to split everyone into 2 groups of any size.
    - Each person may dislike some other people, and they should not go into the same group
 Formally, is dislike[i] = [a,b], it meeans it is not allowed to put the people numbered a and b into the same group
 Return true if and only if it is possible to split everyone into groups this way
 
 **/

func possibleBipartition(_ n : Int, _ dislikes: [[Int]]) -> Bool {
    
    var graph = [[Int]]()
    
    for i in 0..<n {
        graph.append([])
    }
    
    for i in dislikes {
        let from = i[0]-1
        let to = i[1]-1
        graph[from].append(to)
        graph[to].append(from)
    }
    var visited = Array(repeating: 0, count: graph.count)
    for i in 0..<n {
        if visited[i] == 0 {
            if BFS(i, graph, &visited) == false {
                return false
            }
            
        }
    }
    return true
}

func BFS(_ node: Int, _ graph: [[Int]], _ visited: inout [Int]) -> Bool {
    var q = [Int]()
    q.append(node)
    visited[node] = 1
    
    while !q.isEmpty {
        let item = q.removeFirst()
        for child in graph[item] {
            if visited[child] == 0 {
                visited[child] = visited[item] == 1 ? 2 : 1
                print(visited[child] = visited[item] == 1 ? 2 : 1)
                q.append(child)
            } else {
                if visited[child] == visited[item] {
                    return false
                }
            }
        }
        
    }
    return true
}

func DFS(_ node: Int,_ graph: [[Int]],_ visited: inout [Int],_ parent: Int? = nil) -> Bool {
    if parent == nil{
        visited[node] = 1
    }
    
    for child in graph[node]{
        if visited[child] == 0 {
            visited[child] = visited[node] == 1 ? 2 : 1
            if !DFS(child, graph, &visited) {
                return false
            }
        } else {
            if visited[child] == visited[node] {
                return false
            }
        }
    }
    
    return true
}

possibleBipartition(4, [[1,2],[1,3],[2,4]])

//: [Next](@next)

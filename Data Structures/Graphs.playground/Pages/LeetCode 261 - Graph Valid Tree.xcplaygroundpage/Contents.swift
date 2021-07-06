import Cocoa

/*
 Given n nodes labeled from 0 to n-1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree
 
 - What is a Tree?
 A tree is a connected graph with no cycles.
 A general tree is unrooted. we can pick any of the vertices as the root.
 
 **/


func isValidGraph(_ n: Int, _ edges: [[Int]]) -> Bool {
    if edges.isEmpty { return true}
    if edges.count == 1 { return true}
    
    var adjList = Array(repeating: [Int](), count: n)
    var visited = [Bool](repeating: false, count: n)
    var parents = [Int](repeating: -1, count: n)
    
    for edge in edges {
        adjList[edge[0]].append(edge[1])
        adjList[edge[1]].append(edge[0])
    }
    var components = 0
    for v in 0...n-1 {
        if visited[v] == false {
            components += 1
            // BFS/DFS
            if DFS(source: v, adjList: adjList, visited: &visited, parents: &parents) == true {
                return false
            }
            if components > 1 {
                return false
            }
            
        }
    }
    return true
}

// When using BFS we are looking for cross edges
// There will be and edge between the two vertices
// but neither will be the parent of the other.

func BFS(source: Int, adjList: [[Int]], visited: inout [Bool], parents: inout [Int]) -> Bool {
    
    var q = QueueArray<Int>()
    q.push(source)
    visited[source] = true
    
    while !q.isEmpty {
        if let node = q.pop() {
            for neighbor in adjList[node] {
                if visited[neighbor] == false {
                    visited[neighbor] = true
                    parents[neighbor] = node
                    q.push(neighbor)
                } else {
                    if neighbor != parents[node] {
                        return true
                    }
                }
            }
        }
    }
    return false
}


func DFS(source: Int, adjList: [[Int]], visited: inout [Bool], parents: inout [Int]) -> Bool {
    visited[source] = true
    for neighbor in adjList[source] {
        if visited[neighbor] == false {
            parents[neighbor] = source
            if DFS(source: neighbor, adjList: adjList, visited: &visited, parents: &parents) == true{
                return true
            }
            
        } else { // neighbor has been visited
                if  neighbor != parents[source] {
                    return true
                }
                
            }
    }
    return false
}


isValidGraph(5,[[0,1],[0,2],[0,3],[1,4]])
isValidGraph(5, [[0,1],[1,2],[2,3],[1,3],[1,4]])

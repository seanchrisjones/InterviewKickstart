//: [Previous](@previous)

import Foundation
/*
 Reversing the graph
 
 **/

class Node {
    var val: Int
    var neighbours: Array<Node>
    
    init( _ val: Int) {
        self.val = val
        self.neighbours = Array<Node>()
    }
}

func build_other_graph(node: Node) -> Node {
    var graph = [Node]()
    graph.append(node)
    for neighbor in node.neighbours {
        graph.append(neighbor)
    }
    var visited = [Int:Bool]()
    for node in graph {
        visited[node.val] = false
        
    }
    
    return node
}

func bfs(node: Node, graph: inout [Node], visited: inout [Int:Bool]) {
    var q = [Node]()
    q.append(node)
    visited[node.val] = true
    
    while !q.isEmpty {
        let currentNode = q.removeFirst()
        for neighbor in graph.first(where: neighbor.val == currentNode)
    }
    
}





//: [Next](@next)

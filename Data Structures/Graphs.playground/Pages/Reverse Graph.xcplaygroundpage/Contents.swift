//: [Previous](@previous)

import Foundation
/*
 Reversing the graph
 - we are given the graph so we dont need to build it
 - perform a DFS or BFS
 - Clone  the current node
 - reverse the direction of the child
 
 **/

class Node {
    var val: Int
    var neighbours: Array<Node>
    
    init( _ val: Int) {
        self.val = val
        self.neighbours = Array<Node>()
    }
}

extension Node: Hashable {
    
    static func == (lhs: Node, rhs: Node) -> Bool{
        return lhs.val == rhs.val
    }
    
}
extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val > rhs.val
    }
    
    
}

func build_other_graph(node: Node) -> Node {
    var visited : Set<Int> = []
    var map = [Int : [Node]]()
    dfs(node: node, map: &map, visited: &visited)
    
    for n in map.keys {
        // here is the problem Node does not conform to hashable so we cannot base the nictionary on the nodes but the values
        var n1 = map[n]
        for neighbour in n1! {
            
        }
        
    }
    
    return node
}

func dfs(node: Node, map: inout [Int : [Node]], visited: inout Set<Int>) {
    visited.insert(node.val)
    //clone the node.
    map[node.val] = nil
    for neighbour in node.neighbours {
        if !visited.contains(neighbour.val) {
            map[node.val]?.append(neighbour)
            dfs(node: neighbour, map: &map, visited: &visited)
            
        }
    }
   
}





//: [Next](@next)

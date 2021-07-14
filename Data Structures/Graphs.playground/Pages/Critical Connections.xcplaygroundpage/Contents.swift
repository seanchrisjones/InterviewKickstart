//: [Previous](@previous)

import Foundation

/*
 Given a network of servers where each server is connected to every other server directly or indirectly through the bidirectional connections in the network, find all the critical connections.
 
 A connection in a connected network is said to be critical if removing it disconnects the network.
 
 **/

var globalBox = [[Int]]()
func find_critical_conncections(number_of_servers: Int, connections: [[Int]]) -> [[Int]] {
    var dic = [Int: [Int]]()
    var res = [[Int]]()
    
    for array in connections {
        if array.count == 1 {
            res.append([-1,-1])
            return res
        }
        dic[array[0], default: []].append(array[1])
        dic[array[1], default: []].append(array[0])
    }
    var stepTracker = Array(repeating: -1, count: number_of_servers)
    
    if connections.count <= 1{
        res.append(connections[0])
        return res
        
    }
    dfs(0, -1, 0, dic, &stepTracker, &res)
    
    if res.isEmpty {
        res.append([-1,-1])
    }
    
    return res
    
}

func dfs(_ currentNode: Int, _ parentNode: Int, _ step: Int, _ dic: [Int: [Int]],_ stepTracker: inout [Int], _ res: inout [[Int]]) -> Int {
    stepTracker[currentNode] = step+1
    for child in dic[currentNode]! {
        if child == parentNode {
            continue
        } else if stepTracker[child] == -1 {
            stepTracker[currentNode] = min(stepTracker[currentNode], dfs(child, currentNode, step+1, dic, &stepTracker, &res))
        } else {
            stepTracker[currentNode] = min(stepTracker[currentNode], stepTracker[child])
        }
       
    }
    if stepTracker[currentNode] == step+1 && currentNode != 0 {
        res.append([currentNode,parentNode])
    }
    return stepTracker[currentNode]
    
}

find_critical_conncections(number_of_servers: 1, connections: [[0],[2]])

//: [Next](@next)

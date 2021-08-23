//: [Previous](@previous)

import Foundation

/*
 Find the order of characters in an alien dictionary
 topological sort:
    directed graph: linear order of vertices (U,V) where vertex U comes befor V
    Directed Acyclic graph -> directed graph with no cycles.
 
 We'll keep track of 3 things
    - a list of Vertices
        - Each vertex will have its list of children
        - Each Vertex will have an in-degree count
 
 
 -The vertex with an in-degree of 0 will be first vertex in the queue
 for each child of the the vertex added to the queue
    - decrement the in degree by 1
 
 **/

func findOrder(_ words: [String])  -> String{
    
    //1 Build Graph
    var map = [Character : [Character]]() // This will be the adjacency list
    var inDegree = [Character : Int]() // this will store the list of the chars and their in-degrees
    // following long with the class
    
    
    for word in 0...words.count-1 {
        
        for char in words[word] {
            if map[char] == nil {
                map[char] = []
                inDegree[char] = 0
            }
        }
    }
    // find ordering of characters
        //  go over our words until a mismatch is found
        // word with smaller length comes first
    
    for i in 0..<words.count-1 {
     var string1 = words[i]
     var string2 = words[i+1]
        
     var len = min(string1.count, string2.count)
        for k in 0..<len {
            var char1 = string1[string1.index(string1.startIndex, offsetBy: k)]
            var char2 = string2[string2.index(string2.startIndex, offsetBy: k)]
            //print("Char1: \(char1) Char2: \(char2)")
            if char1 != char2 {
                map[char1]?.append(char2)
                inDegree[char2]! += 1
                break
            }
        }
    }
    return BFS(map, &inDegree)
    
}

func BFS( _ graph: [Character: [Character]], _ inDegrees: inout [Character: Int]) -> String {
    //print("in BFS")
    var queue = [Character]()
    var resultString = ""
    for char in graph.keys {
        if inDegrees[char] == 0 {
            queue.append(char)
        }
    }
    while !queue.isEmpty {
        var currentChar = queue.removeFirst()
        //print(currentChar)
        resultString = resultString + String(currentChar)
        for child in graph[currentChar]! {
            inDegrees[child]! -= 1
            if inDegrees[child] == 0 {
                queue.append(child)
            }
        }
    }
    return resultString
}

findOrder(["AABCDB","AACCD", "BADCC", "BBCD","CAB", "DBA"])

// time complexity: O(2* number of chars) building the graph
    // O( number of chard + number of words)

// Space Complexity: 0(number of chars)

//: [Next](@next)

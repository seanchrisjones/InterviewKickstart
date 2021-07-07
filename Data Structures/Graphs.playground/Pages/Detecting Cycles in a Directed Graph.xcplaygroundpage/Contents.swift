//: [Previous](@previous)

import Foundation

func DFS(node: Int, visited:inout  [Int], adjList: [[Int]], arrival: inout [[Int]], departure: inout [[Int]], timeStamp: inout Int) -> Bool{
    arrival[node] = timeStamp
    timeStamp += 1
    visited[node] = 1
    for neighbor in adjList[node] {
        if  visited[neighbor] == -1 {
            
            if DFS(node: node, visited: &visited, adjList: adjList, arrival: &arrival, departure: &departure, timeStamp: &timeStamp) == true {
                return true
            }
        } else {
            // neighbor is already visited
            if departure[neighbor] == -1 {
                // there is a cycle
            }
        }
        
    }
    departure[node] = timeStamp+= 1
    return false
}

/*
 
 from this template we can determine the number of descendants a source vertex has
 let's say that  vertex 0 has an Arrival time of 0 and a departured time of 11.
 from this we can figure out the number 1-10 were used in traversing the descendants of 0
 for each of the descendants there is an edge going in and an edge going out
 10/2 = 5
 so  vertex 0 has 5 descendants
 **/

//: [Next](@next)

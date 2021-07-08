//: [Previous](@previous)

import Foundation

func findOrder(numCourses: Int, prerequisites: [[Int]]) -> [Int] {
    var visited = Array(repeating: -1, count: numCourses)
    var arrival = Array(repeating: 0, count: numCourses)
    var departure = Array(repeating: 0, count: numCourses)
    var timeStamp = 0
    var adjList = [Int: [Int]]()
    var topSort = [Int]()
    for prereq in prerequisites {
        adjList[prereq[0], default: []].append(prereq[1])
    }
    
    
    // we will need the outer loop for this to explore the entire graph
    for i in 0...numCourses-1 {
        if visited[i] == -1 {
            if DFS(node: i, visited: &visited, adjList: adjList, arrival: &arrival, departure: &departure, timeStamp: &timeStamp, topSort: &topSort) == true {
                return []
            }
        }
    }
    //topSort.reverse()
    return topSort
}

func DFS(node: Int, visited:inout  [Int], adjList: [Int: [Int]], arrival: inout [Int], departure: inout [Int], timeStamp: inout Int, topSort: inout [Int]) -> Bool{
    arrival[node] = timeStamp
    timeStamp += 1
    visited[node] = 1
    
    
    for neighbor in adjList[node] ?? [] {
        
        if visited[neighbor] == -1 {
            if DFS(node: neighbor, visited: &visited, adjList: adjList, arrival: &arrival, departure: &departure, timeStamp: &timeStamp, topSort: &topSort) == true {
                return true
            }
        } else {
            // neighbor is already visited
            if departure[neighbor] == 0 {
                return true
            }
        }
    }
    departure[node] = timeStamp+1
   //print(departure)
    topSort.append(node)
    //for part 2 create an Array to store the courses
    return false
}

findOrder(numCourses: 4, prerequisites: [[1,0],[2,0],[3,1],[3,2]])


//: [Next](@next)

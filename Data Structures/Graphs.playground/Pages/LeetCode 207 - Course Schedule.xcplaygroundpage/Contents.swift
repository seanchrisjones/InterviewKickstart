//: [Previous](@previous)

import Foundation

/*
 
 There are a total of n courses you have to take labeled from  0 to n-1
 some courses may have prerequisites. for example to take course 0 you have to take course 1 which is represent by a pair [0,1]
 given the total number of courses and a list of prerequisite pairs. is it possicle to finish all of the courses?
 **/


func canFinish(numCourses: Int, prerequisites: [[Int]]) -> Bool {
    var visited = Array(repeating: -1, count: numCourses)
    var arrival = Array(repeating: 0, count: numCourses)
    var departure = Array(repeating: 0, count: numCourses)
    var timeStamp = 0
    var adjList = [Int: [Int]]()
    for prereq in prerequisites {
        adjList[prereq[0], default: []].append(prereq[1])
    }
    
    
    // we will need the outer loop for this to explore the entire graph
    for i in 0...numCourses-1 {
        if visited[i] == -1 {
            if DFS(node: i, visited: &visited, adjList: adjList, arrival: &arrival, departure: &departure, timeStamp: &timeStamp) == true {
                return false
            }
        }
    }
    
    return true
}

func DFS(node: Int, visited:inout  [Int], adjList: [Int: [Int]], arrival: inout [Int], departure: inout [Int], timeStamp: inout Int) -> Bool{
    arrival[node] = timeStamp
    timeStamp += 1
    visited[node] = 1
    
    
    for neighbor in adjList[node] ?? [] {
        
        if visited[neighbor] == -1 {
            if DFS(node: neighbor, visited: &visited, adjList: adjList, arrival: &arrival, departure: &departure, timeStamp: &timeStamp) == true {
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
    print(departure)
    //for part 2 create an Array to store the courses
    return false
}

canFinish(numCourses: 2, prerequisites: [[1,0],[0,1]])

//: [Next](@next)

//: [Previous](@previous)

import Foundation

/*
 
 Level order traversal is just another word for Breadth First Search (BFS)
 - we traversal the tree from the root from left to right
 
 the below code is the template for BFS for trees
 **/


//func bfs(root: BinaryNode) -> [Int] {
//    var q = QueueArray<Int>()
//    q.push(root)
//    var result = [Int]
//
//    while !q.isEmpty {
//        var node: BinaryNode = q.pop()
//        result.append(node.value)
//
//        if node.leftChild != nil {
//            q.push(node.leftChild!)
//        }
//
//        if node.rightChild != nil {
//            q.push(node.rightChild!)
//        }
//    }
//    return result
//
//}


/*
 below we are modifying the template to create the inner lists for each LVL of the tree.
 -  if given a tree in the form of an array how would we create the tree?
 
 - space and time for the below is O(n)
 **/

func LVLOrder(root: BinaryNode<Int>) -> [[Int]] {
    var q = QueueArray<BinaryNode<Int>>()
    q.push(root)
    var result = [[Int]]()
    
    while !q.isEmpty {
        var numNodes = q.count
        var temp: [Int] = []
        repeat {
            if let node: BinaryNode<Int> = q.pop() {
                temp.append(node.value)
            if node.leftChild != nil {
                q.push(node.leftChild!)
            }
            if node.rightChild != nil {
                q.push(node.rightChild!)
            }
            }
           
            numNodes -= 1
            
        } while numNodes > 0
        result.append(temp)
    }
    print(result)
    return result
    
}

var root = BinaryNode(value: 3)
root.rightChild = BinaryNode(value: 7)
root.leftChild = BinaryNode(value: 9)
root.rightChild!.rightChild = BinaryNode(value: 16)
root.rightChild!.leftChild = BinaryNode(value: 15)
root.leftChild!.leftChild = BinaryNode(value: 22)
root.leftChild!.rightChild = BinaryNode(value: 71)

LVLOrder(root: root)

//: [Next](@next)

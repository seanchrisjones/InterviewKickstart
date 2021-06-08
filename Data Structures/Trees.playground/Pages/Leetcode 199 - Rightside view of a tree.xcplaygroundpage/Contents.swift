//: [Previous](@previous)

import Foundation

/*
 Given a binary tree, imagine yourself standing on the right side of it
 
 - using the template for BFS, the code for this problem will be quite simple with only  one small change
 - instead of appening each LVL  from the temp array to the result, we will just append the last element of the temp array
 **/

func rightSideView(root: BinaryNode<Int>) -> [[Int]] {
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
        var newTemp = Array(temp.dropFirst(temp.count-1))
        result.append(newTemp)
    }
    print(result)
    return result
    
}

/*
 - There were a few syntactical changes that had to be made to get the code for this to work
 - In theory, we would just return the last element of the temp array because it is the right most element of that LVL
 - we need to create a new variable called new temp  by dropping all but the last element from the temp array.
 - This will create an array slice so we have to typecast it as an array for it to fit into our result.
 - BEWARE of the edge case where temp will only have one node 
 
 **/

var root = BinaryNode(value: 3)
root.rightChild = BinaryNode(value: 7)
root.leftChild = BinaryNode(value: 9)
root.rightChild!.rightChild = BinaryNode(value: 16)
root.rightChild!.leftChild = BinaryNode(value: 15)
root.leftChild!.leftChild = BinaryNode(value: 22)
root.leftChild!.rightChild = BinaryNode(value: 71)

rightSideView(root: root)

//: [Next](@next)

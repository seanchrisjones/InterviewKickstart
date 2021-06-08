//: [Previous](@previous)

import Foundation

/*
 Given a binary tree return the Lvl orde traversal as a list of lists in zigzag pattern
 
 - We can use the BFS pattern for this as well with some small modifications
 - for every other LVL we will reverse the temp array before appending to the result array
 
 **/

func zigzag(root: BinaryNode<Int>) -> [[Int]] {
    var q = QueueArray<BinaryNode<Int>>()
    q.push(root)
    var result = [[Int]]()
    var flag: Bool = false
    
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
        if flag {
            temp.reverse()
        }
        result.append(temp)
        flag.toggle()
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

zigzag(root: root)

//: [Next](@next)

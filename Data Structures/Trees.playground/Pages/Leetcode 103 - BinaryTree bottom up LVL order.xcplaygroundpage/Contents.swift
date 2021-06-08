//: [Previous](@previous)

import Foundation


/*
 Given a binary tree, return the LVL order traversal of its nodes' values from left to right  Lvl by LVL in bottom up order
 
 - The code for this problem will be much the same as the template
 - The only change would be that we reverse the result before retuning it.
 **/

func bottomUp(root: BinaryNode<Int>) -> [[Int]] {
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
    result.reverse()
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

bottomUp(root: root)

//: [Next](@next)

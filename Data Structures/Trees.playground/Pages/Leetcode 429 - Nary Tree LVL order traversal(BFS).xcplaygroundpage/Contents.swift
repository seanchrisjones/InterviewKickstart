//: [Previous](@previous)

import Foundation

/*
 LVL order traversal for a N-ary tree will be similar to that of a binary tree with some slight changes.
 - In the inner loop where we're checking for the left and right child, We'll iterate over the array(list of children)
 - The time and space complexity will not change
 
 
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
 
 **/

func NaryLVLOrder(root: TreeNode<Int>) -> [[Int]] {
    var q = QueueArray<TreeNode<Int>>
    q.push(root)
    var result = [[Int]]()
    
    while !q.isEmpty {
        var numNodes = q.count
        var temp: [Int] = []
        
        repeat {
            if let node: TreeNode<Int> = q.pop() {
                temp.append(node.value)
                
                if !node.children.isEmpty {
                    node.children.foreach {
                        q.push(child.value)
                    }
                }
                numNodes -= 1
            }
        } while numNodes > 0
        result.append(temp)
    }
   return result
}

// this code should work but I need to update the implementation of tree node in the sources of this playground. At the Moment it is for a Binary tree

// the number of nodes in an N-ary tree will be N-1 the number of edges

var root = TreeNode<Int>(7,7)
//: [Next](@next)

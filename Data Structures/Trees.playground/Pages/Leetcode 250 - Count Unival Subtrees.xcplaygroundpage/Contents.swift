//: [Previous](@previous)

import Foundation

/*
 
 Count Unival subtrees
 
 Given a binary tree, count the number of unival subtrees.
 A unival subtree means all nodes of the subtree have the same value.
 
 - a tree has n sub trees
 each node in a tree can be the root of  its own subtree
 
 - each leaf node will be its own unival subtree
 - we'll need a counter
 
 
 Global problem: Count the number of unival subtrees
 Per-Node local problem: each node computes whether or not the subtree root at it is unival
 
 Theory: Check if each node has a left and right child. Then check if those child nodes have the same value as the parent node
 if the values from the given node are the same all the way to the leaf nodes count the sub tree.
 count all leaf nodes as a sub tree.
 **/



//: [Next](@next)


func dfs(node: BinaryNode<Int>, globalCount: inout Int) -> Bool {
    
    
    var amIUnival = false
    // base case: leaf node
    if node.leftChild == nil && node.rightChild == nil {
        globalCount += 1
        return true
    }
    
    // recursive case: internal node
    if let leftChild = node.leftChild {
        var BL =  dfs(node: leftChild, globalCount: &globalCount)
        
        if BL = false || node.value != leftChild.value {
            amIUnival = false
        }
    }
    
    if let rightChild = node.rightChild {
        var BR = dfs(node: rightChild, globalCount: &globalCount)
        if BR = false || node.value != rightChild.value {
            amIUnival = false
        }
    }
    
    
    if amIUnival {
        globalcount += 1
    }
    
    return amIUnival
    
}


func countUnivalSubtrees(root: BinaryNode<Int>) {
    var globalCount = 0
    dfs(node: root, globalCount: &globalCount)
    return globalCount
    
}

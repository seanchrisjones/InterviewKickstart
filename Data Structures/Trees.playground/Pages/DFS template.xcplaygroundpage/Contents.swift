//: [Previous](@previous)

import Foundation

/*
 Depth First Search
 
  - DFS is done recursively
  - We take the lazy manager approach for DFS
  - If there are left/Right children for the node we're passing we recurively call the DFS function on the child nodes
  - in DFS if a node has two children it is the left children node that wil be processed 3first
 **/



func driver(root: BinaryNode<Int>) {
    dfs(node: root)
}

func dfs(node: BinaryNode<Int>) {
    
   // base case: leaf lvl node
    if node.leftChild == nil && node.rightChild == nil {
        
    }
    // recursive case: inner node
    if node.leftChild != nil {
        dfs(node: node.leftChild!)
    }
    if node.rightChild != nil {
        dfs(node: node.rightChild)
    }
    
}

//: [Next](@next)

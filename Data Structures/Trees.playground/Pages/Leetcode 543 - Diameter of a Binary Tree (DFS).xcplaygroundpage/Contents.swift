//: [Previous](@previous)

import Foundation

/*
 Given a  binary tree, you need to compute the length of the diameter of the tree.  The diamter of a binary tree is the length of the longest ath between any two nodes in a tree.  This path may or may not pass through the root.
 - the longest path will always end at a leaf node
 
 global problem: find the diamter of the whole tree
 
 local problem: Each node finds the longest inverted V path through itself as the corner
 - we neded the longest root to leaf path in each sub tree, the height of the sub tree
 - compute the path of the parent node
 - once we have the local solution we can compute  with the left and right heights
 
 T(n) = )(n)
 S(n) = o(height of the tree)
 
 // this is the psuedo code below. run it to make it work in swift
 **/

//: [Next](@next)

var root = BinaryNode(value: 1)
var two = BinaryNode(value: 2)
var three = BinaryNode(value: 3)
var four = BinaryNode(value: 4)
var five = BinaryNode(value: 5)

root.leftChild = two
root.rightChild = three
two.leftChild = four
two.rightChild = five

func computeDiameter(root: BinaryNode<Int>) {
    var globalDia = 0
    dfs(node: root)
    return globalDia
}


func dfs(node: BinaryNode<Int>) -> Int {
    
    // base case leaf node
    if node.leftChild == nil && node.rightChild == nil {
        return 0
    }
    // recursive case: internal node
    var myDia = 0
    if node.leftChild != nil {
        
      var leftHeight = dfs(node: node.leftChild!)
      myDia += leftHeight+1
    }
    
    if node.rightChild != nil {
        var rightHeight = dfs(node: node.rightChild!)
        myDia += rightHeight+1
    }
    var globalDia = max(globalDia,myDia)
    return rightHeight+leftHeight+1
}

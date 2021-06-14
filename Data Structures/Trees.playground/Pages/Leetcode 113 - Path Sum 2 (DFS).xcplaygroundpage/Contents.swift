//: [Previous](@previous)

import Foundation

/*
 Path Sum 2
 Given a binary tree and a sum, find all root-to-leaf paths where each paths sum equals the given sum
 T(n) = O(n log n)
 S(n) = O(n log n)
 any BFS problem can be solved using top-down DFS
 **/

//: [Next](@next)
var root = BinaryNode(value: 5)
var four = BinaryNode(value: 4)
var eight = BinaryNode(value: 8)
var eleven = BinaryNode(value: 11)
var thirteen = BinaryNode(value: 13)
var dupeFour = BinaryNode(value: 4)
var seven = BinaryNode(value: 7)
var two = BinaryNode(value: 2)
var five = BinaryNode(value: 5)
var one = BinaryNode(value: 1)

root.leftChild = four
root.rightChild = eight
four.leftChild = eleven
eight.leftChild = thirteen
eight.rightChild = dupeFour
eleven.leftChild = seven
eleven.rightChild = two
dupeFour.leftChild = five
dupeFour.rightChild = one



func driver(root: BinaryNode<Int>, target: Int) {
    var globalBox = [[Int]]()
    dfs(node: root, target: &target, slate: &[])
    return globalBox
    
}

func dfs(node: BinaryNode<Int>, target:  inout Int, slate: inout [Int]) {
    
    //base case: leaf node
    if node.rightChild == nil && node.leftChild == nil {
        if target == node.value {
            slate.append(node.value)
            var slateCopy = slate
            globalBox.append(slateCopy)
            slate.popLast()
        }
    }
    
    // recursive case: internal node
    
    if node.leftChild != nil {
        target -= node.leftchild!.value
        slate.append(node.leftChild!.value)
        dfs(node: node.leftChild!, target: &target, slate: &slate)
        slate.popLast()
    }
    
    if node.rightChild != nil {
        target -= node.rightChild.value
        slate.append(node.rightChild!.value)
        dfs(node: node.rightChild!, target: &target, slate: &slate)
        slate.popLast()
    }
    
    
}

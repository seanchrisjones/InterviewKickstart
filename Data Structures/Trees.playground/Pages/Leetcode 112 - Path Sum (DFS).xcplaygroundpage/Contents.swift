//: [Previous](@previous)

import Foundation

/*
 PATH SUM
 
 given a binary tree and a sum determin if the tree has a root to leaf path such that adding up all the values equals the given sum
 **/

func driver(root: BinaryNode<Int>, target: Int){
    var runningSum = target
    dfs(node: root, runningSum: &runningSum)
    
}

func dfs(node: BinaryNode<Int>, runningSum: inout Int) -> Bool {
    var result: Bool = false
    // base case: leaf Node
    if node.leftChild == nil && node.rightChild == nil {
        print("leaf -> runningSum \(runningSum)")
        if runningSum - node.value == 0 {
            result = true
            print(result)
            return result
        } else {
            return result
        }
    }
    
    // recursive case: Internal node
    
    if node.leftChild != nil {
        runningSum -= node.value
        dfs(node: node.leftChild!, runningSum: &runningSum)
    }
    
    if node.rightChild != nil {
        runningSum -= node.value
        dfs(node: node.rightChild!, runningSum: &runningSum)
    }
    
    return result
}

var root = BinaryNode(value: 1)
var two = BinaryNode(value: 2)
var three = BinaryNode(value: 3)
var four = BinaryNode(value: 4)
var five = BinaryNode(value: 5)
var six = BinaryNode(value: 6)
var seven = BinaryNode(value: 7)
var eight = BinaryNode(value: 8)
var nine = BinaryNode(value: 9)
var ten = BinaryNode(value: 10)

root.leftChild = two
root.rightChild = three
two.leftChild = four
two.rightChild = five
four.rightChild = ten
three.leftChild = six
three.rightChild = seven
six.leftChild = eight
eight.rightChild = nine

driver(root: root, target: 17)

//: [Next](@next)

//: [Previous](@previous)

import Foundation

/*
 
 
 Given preorder and inorder traversal of a tree construct the binary tree
 
 **/

//func helper( _ P:[Int],_ startP: inout Int,_ endP: inout Int,_ I: [Int],_ startI: inout Int,_ endI: inout Int, _ hash: inout[Int:Int]) -> BinaryNode<Int>? {
//   //base case
//
//    if startP > endP {
//        // size 0
//        return nil
//    }
//    if startP == endP {
//        // size 1
//        return BinaryNode(value:P[startP])
//    }
//
//    //recursive case
//    var rootNode = BinaryNode<Int>(value: P[startP])
//    var rootIndex = hash[P[startP]]
//    var numleft = rootIndex = startI
//    var numRight = endI - rootIndex
//
//
//    var rootNode.leftChild = helper(P, &startP+1, &startP+numleft, I, &startI, &rootIndex-1, &hash)
//    var rootNode.rightChild = helper(P, &startP+numleft+1, &endP, I, &rootIndex+1, &endI, &hash)
//
//
//    return rootNode
//}
//
//func driver(preorer: [Int], inorder: [Int]) {
//    var hashMap = [Int: Int]()
//    for i in 0...inorder.count-1 {
//        hashMap[inorder[i]] =  i    }
//
//    return helper(preorer, &0, &preorer.count-1, inorder, &0, &inorder.count-1, &hashMap)
//}
var map = Dictionary<Int,Int>()
var idx = 0
func buildTree (_ preOrder: [Int], _ inorder: [Int]) -> BinaryNode<Int>? {
    for (i, val) in inorder.enumerated() {
        map[val] = i
    }
    
    return helper(inorder, preOrder, idx, preOrder.count-1)
    
}

func helper(_ inorder: [Int], _ preorder: [Int], _ start: Int, _ end: Int) -> BinaryNode<Int>? {
    if start > end { return nil}
    let val = preorder[idx]
    let index = map[val]!
    let node = BinaryNode(value: val)
    idx+=1
    
    node.leftChild = helper(inorder, preorder, start, index-1)
    node.rightChild = helper(inorder, preorder, index+1, end)
    return node
}


buildTree([3,9,20,15,7],[9,3,15,20,7])

//: [Next](@next)

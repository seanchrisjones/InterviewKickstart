//: [Previous](@previous)

import Foundation

/*
 
 return the root node of a binary search tree that matches the given preorder traversal
 - the most popular form of tree construction is top down
 1. figure out what the root is and construct it.
 2. Recursively construct the left subtree
 3. Recursively construct the right subtree
 
 Leet code 108- convert a sorted array into a binary search tree
 for this problem a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1 - AVL Tree
 
 
 - the middle element of the array will be the root
 - we will make a left sub array and a right sub array
 
 what is the sub problem of that a single worker in this hierarchy will be getting?
 **/




//func helper(array: inout [Int], start: inout Int, end: inout Int) -> BinaryNode<Int>? {
//    // base case
//    if start > end {
//        return nil
//    }
//
//    if start == end {
//        return BinaryNode<Int>(value:array[start])
//    }
//
//    // Recursive case
//    var mid = start+end/2
//    var root = BinaryNode<Int>(value:array[mid])
//    root.leftChild = helper(array: &array, start: &start, end: &mid-1)
//    root.rightChild = helper(array: &array, start: &mid+1, end: &end)
//
//    return root
//}
//
//func driver(nums: [Int]) -> [Int] {
//    var numsCopy = nums
//    var start = 0
//    var end = nums.count-1
//    return helper(array: &numsCopy, start: &start, end: &end)
//}


func driver( nums: [Int]){
   var tree = BinarySearchTree<Int>()
    for i in nums {
        tree.insert(nums[i])
    }
    print("hello")
}

//: [Next](@next)

driver(nums: [1,2,3,4,5,6,7,8,9])

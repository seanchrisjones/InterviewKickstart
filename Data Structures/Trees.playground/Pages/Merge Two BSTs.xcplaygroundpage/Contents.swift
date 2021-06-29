//: [Previous](@previous)

import Foundation

/*
 Given two Binary Search Trees BSTs, your task is to merge them into a single Height Balance BST
 **/

class TreeNode {
    var val: Int
    var left_ptr: TreeNode?
    var right_ptr: TreeNode?
    
    init(val: Int) {
        self.val = val
    }
    
}


var root = TreeNode(val:100 )
root.left_ptr = TreeNode(val: 200)
root.right_ptr = TreeNode(val: 300)
root.left_ptr?.left_ptr = TreeNode(val:400)
root.left_ptr?.right_ptr = TreeNode(val: 500)
root.left_ptr?.left_ptr?.left_ptr = TreeNode(val: 600)
root.left_ptr?.left_ptr?.right_ptr = TreeNode(val: 700)

var bstRoot = TreeNode(val: 100)
bstRoot.left_ptr = TreeNode(val: 50)
bstRoot.right_ptr = TreeNode(val: 150)
bstRoot.left_ptr?.left_ptr = TreeNode(val: 22)
bstRoot.left_ptr?.right_ptr = TreeNode(val: 55)
bstRoot.right_ptr?.left_ptr = TreeNode(val: 125)
bstRoot.right_ptr?.right_ptr  = TreeNode(val:157)


func merge_two_BSTs( root1: TreeNode?, rootTwo: TreeNode?) -> TreeNode? {
    
}
//: [Next](@next)

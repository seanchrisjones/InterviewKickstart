//: [Previous](@previous)

import Foundation

/*
 UPSIDE DOWN
 
 GIVEN A BINARY TREE WHERE EVERY NODE EITHER HAS 0 OR 2 CHILDREN AND EVERY RIGHT NODE IS A LEAF NODE
 - FLIP IT UPSIDE DOWN WHERE EVERY LEFT NODE IS A LEAF NODE
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


func flipUpsideDown(root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil}
    
    if root == nil || root.left_ptr == nil {
        return root
    }
    
    var newRoot = flipUpsideDown(root: root.left_ptr)
    root.left_ptr?.left_ptr = root.right_ptr
    root.left_ptr?.right_ptr = root
    root.left_ptr = nil
    root.right_ptr = nil
    return newRoot
}

flipUpsideDown(root: root)

//: [Next](@next)

//: [Previous](@previous)

import Foundation

/*
 GIVEN A BINARY TREE, FIND ITS POST ORDER TRAVERSAL WITHOUT USING RECUSRIONS
 POST ORDER TRAVERSAL ONLY VISITS THE CURRENT NODE AFTER THE LEFT AND RIGHT CHILDREN HAVE BEEN VISITED
 **/

class TreeNode {
    var val: Int
    var left_ptr: TreeNode?
    var right_ptr: TreeNode?
    
    init(val: Int) {
        self.val = val
    }
    
}

func postorder_traversal(root: TreeNode?) -> [Int] {
    var trav = [Int]()
    helper(node: root, trav: &trav)
    return trav
}

func helper(node: TreeNode?, trav: inout[Int]) {
    guard let node = node else {
        return
    }
    
    if node.left_ptr == nil && node.right_ptr == nil {
        trav.append(node.val)
    }
    if let left = node.left_ptr {
        helper(node: left, trav: &trav)
    }
    if let right = node.right_ptr {
        helper(node: right, trav: &trav)
    }
    //trav.append(node.val)
}

var root = TreeNode(val:100 )
root.left_ptr = TreeNode(val: 200)
root.right_ptr = TreeNode(val: 300)
root.left_ptr?.left_ptr = TreeNode(val:400)
root.left_ptr?.right_ptr = TreeNode(val: 500)

postorder_traversal(root: root)

//: [Next](@next)


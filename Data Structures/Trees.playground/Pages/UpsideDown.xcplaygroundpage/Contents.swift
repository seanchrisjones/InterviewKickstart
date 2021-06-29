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
    guard let root = root else { return nil}// 1
    
    if root == nil || root.left_ptr == nil {
        return root// 2
    }
    
    var newRoot = flipUpsideDown(root: root.left_ptr) //3
    //root.left_ptr?.left_ptr = root.right_ptr// 4
    //root.left_ptr?.right_ptr = root // 5
    //root.left_ptr = nil // 6
    //root.right_ptr = nil// 7
    return newRoot// 8
}

flipUpsideDown(root: root)

/*
 ALGORITHM EXPLANATION
 
 1-  confirm that the root exists else return nil
 2-  if the root  does not have a left child it can't be done just return the root
 3- create a newRoot by recurively calling flip w/ root.left as the argument
    - this will set the root to the lowest and farthest left node on the tree
 4- The left-left child of root become its right child
 5- the left-right child of root becomes the root
 6- root.left becomes nil
 7- root.right becomes nil
 8- return the new root
 
 **/

//: [Next](@next)

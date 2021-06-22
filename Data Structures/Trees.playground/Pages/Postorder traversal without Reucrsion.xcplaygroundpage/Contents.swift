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

//func postorder_traversal(root: TreeNode?) -> [Int] {
//    var trav = [Int]()
//    helper(node: root, trav: &trav)
//    return trav
//}
//
//func helper(node: TreeNode?, trav: inout[Int]) {
//    guard let node = node else {
//        return
//    }
//
//    if node.left_ptr == nil && node.right_ptr == nil {
//        trav.append(node.val)
//    }
//    if let left = node.left_ptr {
//        helper(node: left, trav: &trav)
//    }
//    if let right = node.right_ptr {
//        helper(node: right, trav: &trav)
//    }
//    //trav.append(node.val)
//}

var root = TreeNode(val:100 )
root.left_ptr = TreeNode(val: 200)
root.right_ptr = TreeNode(val: 300)
root.left_ptr?.left_ptr = TreeNode(val:400)
root.left_ptr?.right_ptr = TreeNode(val: 500)

//postorder_traversal(root: root)


var parentStack = Stack<TreeNode>()

func postOrder(root: TreeNode?) -> [Int]? {
    guard let  node = root else { return nil }
    var result = [Int]()
    
    if node.left_ptr != nil || node.right_ptr != nil {
        parentStack.push(node)
        if let left = node.left_ptr {
            leftCheck(node: left, result: &result)
        }
        
    }

    
}

func leftCheck(node: TreeNode, result: inout [Int]) -> [Int] {
    
    if node.left_ptr == nil && node.right_ptr == nil {
        result.append(node.val)
        if let parent = parentStack.peek(){
           rightCheck(node: parent, result: &result)
        }
    }
    
}


func rightCheck(node: TreeNode, result: inout[Int]) -> [Int] {
    if node.right_ptr == nil {
        // if the node has no right child append the node's value to the result
        // pop the node from the parentStack
        // peek at the node's parent
        result.append(node.val)
        parentStack.pop()

        if let parent = parentStack.peek() {
            
        }
    }
    
}


/*
 MAIN FUNCTION PROCEEDURE
 1. check if the root has a left or right child
    - if the node has no children push to  result array and return
 2. if so push to root to the parent stack
 3. Confirm if there is a left Child
 4. If there is a left child call left Check
 
 
 LEFT CHECK PROCEEDURE
    BASE CASE
        1. Check to see if the node is a leaf node.
        2. If so, add the node to the result
        3. pop the parent node from the ParentStack
        4. Check if the parent has a rightChild
        5. if there is a right Child push the parent back to the parent stack
        6. call post order on rightChild.
        7. if there is no rightChild, append the parent node to the result
    
    Iterative case
        1. Check if the node has a left Child
        2. If so, push the node onto the parent stack
        3. call post order on left child.
 
 
 
 
 **/

//: [Next](@next)


//: [Previous](@previous)

import Foundation


/*
 IN ORDER TRAVERSAL
 An inorder traversal is a type of depth first search performed on a Binary Tree
 The traversal will return the nodes of the tree in sorted order
  - we make our way down to the farthes left and down node in the tree
  - Then, we go back up to the parent
  - finally we visit the right child of the parent
 
 we continue this process until we have traversed the entirety of the tree.
 
 
 **/

class TreeNode {
    var val: Int
    var left_ptr: TreeNode?
    var right_ptr: TreeNode?
    
    init(val: Int) {
        self.val = val
    }
    
}

var bstRoot = TreeNode(val: 100)
bstRoot.left_ptr = TreeNode(val: 50)
bstRoot.right_ptr = TreeNode(val: 150)
bstRoot.left_ptr?.left_ptr = TreeNode(val: 22)
bstRoot.left_ptr?.right_ptr = TreeNode(val: 55)
bstRoot.right_ptr?.left_ptr = TreeNode(val: 125)
bstRoot.right_ptr?.right_ptr  = TreeNode(val:157)

func inOrder(root: TreeNode?) -> [Int]{
    var res = [Int](), stack = [TreeNode](), node = root//1
    
    while node != nil || !stack.isEmpty {//2
        if let currentNode = node {// 3
            stack.append(currentNode)//4
            node = currentNode.left_ptr//5
        } else {///6
            let prevNode = stack.removeLast()//7
            res.append(prevNode.val)//8
            node = prevNode.right_ptr//9
        }
    }
    return res
    
}

inOrder(root: bstRoot)

/*
 IN ORDER TRAVERSAL EXPLANATION
 1- create an array to store the values of the nodes, another called stack to store the nodes themselves, and a variable called root which will be the root argument
 2- while the node variable is not storing a nil value  or the stack array is not empty do the following.
    3- if the current node is not nil then we create a variable called current node
    4- we append the current node variable to the stack
    5- we reassign the node variable  to the current node's left child
         We will do this whether the left child exists or not
 6- In the case that  the node variable holds a nil value or the stack is not empty we will do the following
    7- remove the last node from the stack and call it prev node
    8- append the prevNode to the result array
    9- reassign the node variable to the prevNode's right child
        We will do this whether or not the right child exists
 
 
 **/
//: [Next](@next)

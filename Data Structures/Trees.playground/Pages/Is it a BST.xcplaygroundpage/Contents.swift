//: [Previous](@previous)

import Foundation

/*
 Given a Binary tree. Determine whether or not it is a BST
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

var bstRoot = TreeNode(val: 100)
bstRoot.left_ptr = TreeNode(val: 50)
bstRoot.right_ptr = TreeNode(val: 150)
bstRoot.left_ptr?.left_ptr = TreeNode(val: 22)
bstRoot.left_ptr?.right_ptr = TreeNode(val: 55)
bstRoot.right_ptr?.left_ptr = TreeNode(val: 125)
bstRoot.right_ptr?.right_ptr  = TreeNode(val:157)

var globalBox = [[Bool]]()

func isBST(root: TreeNode?) -> Bool {
    guard let root = root else {return true}
    var slate = [Bool]()
    dfs(node: root, root: root, slate: &slate)
    var last = globalBox.last
    if let last = globalBox.last{
        if last.contains(false) {
            return false
        }
    }
   return true
    
      
    
}

func dfs(node: TreeNode?, root: TreeNode, slate: inout[Bool]) {
    guard let node = node else {return}
    
    var parent = node
   
    
    if parent.left_ptr == nil && parent.right_ptr == nil {
        globalBox.append(slate)
        return
    }
    
    if let left = parent.left_ptr{
       
        //left-Left case:
        if parent.val <= root.val {
            if left.val <= parent.val && left.val <= root.val{
                slate.append(true)
                dfs(node: left, root: root, slate: &slate)
            } else {
                
                slate.append(false)
                globalBox.append(slate)
                return
                
            }
        } else if parent.val >= root.val {
            //left-Right case:
            if left.val <= parent.val && left.val >= root.val {
                slate.append(true)
                dfs(node: left, root: root, slate: &slate)
            } else {
                slate.append(false)
                globalBox.append(slate)
                return
                
            }
        }
    }
    
    if let right = parent.right_ptr {
       
        
        if parent.val >= root.val {
            if right.val >= parent.val && right.val >= root.val {
                slate.append(true)
                dfs(node: right, root: root, slate: &slate)
            } else {
                slate.append(false)
                globalBox.append(slate)
                return
                
            }
        } else if parent.val <= root.val {
            if right.val >= parent.val && right.val <= root.val {
                slate.append(true)
                dfs(node: right, root: root, slate: &slate)
            } else {
                slate.append(false)
                globalBox.append(slate)
                return
                
            }
        }
    }
  
}

var univalRoot = TreeNode(val: 1)
univalRoot.left_ptr = TreeNode(val: 1)
univalRoot.right_ptr = TreeNode(val: 1)

isBST(root: univalRoot)


//: [Next](@next)

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

var globalBox = [TreeNode]()


func merge_two_BSTs( root1: TreeNode?, root2: TreeNode?) -> TreeNode? {
    guard let root1 = root1 else { return nil }
    guard let root2 = root2 else { return nil }
    dfs(node: root1)
    dfs(node: root2)
    globalBox.sort { TreeNode1, TreeNode2 in
        TreeNode1.val < TreeNode2.val
    }
    
    if globalBox.count == 0 {
        return nil
    }
    
    return construct(nodes: globalBox, left: 0, right: globalBox.count-1)
    
    
}

func dfs(node: TreeNode?) {
    guard let node = node else {return}
    
    
    if node.left_ptr == nil && node.right_ptr == nil {
        globalBox.append(node)
    }
    
   
    if let left = node.left_ptr {
       
        dfs(node: left)
    }
    
    if let right = node.right_ptr {
        
        dfs(node: right)
    }
}



func construct(nodes: [TreeNode], left: Int, right: Int) -> TreeNode? {
    if left > right {
        return nil
    }
    
    let mid = left + (right - left) / 2
    var tnode = TreeNode(val: nodes[mid].val)
    tnode.left_ptr = construct(nodes: nodes, left: left, right: mid-1)
    tnode.right_ptr = construct(nodes: nodes, left: mid+1, right: right)
    
    return tnode
    
}



merge_two_BSTs(root1: root, root2: bstRoot)





//: [Next](@next)

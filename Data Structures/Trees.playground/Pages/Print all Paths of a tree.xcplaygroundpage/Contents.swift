//: [Previous](@previous)

import Foundation

/*
 Given a Binary Tree, return all paths from root to leaf.
 
 - what do we know?
    this will be a  DFS to every leaf node from the root.
 **/
print("hi")

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

var globalBox = [[Int]]()

func allPathsOfABinaryTree(root: TreeNode?) -> [[Int]]{
    guard let root = root else {return globalBox}
    var slate = [Int]()
  
    dfs(node:root, slate: &slate)
    print(globalBox)
    return globalBox
    
}

func dfs(node: TreeNode?, slate: inout [Int]) {
    //print(pathLength)
    guard let node = node else {return}

    var currentSlate = slate
    currentSlate.append(node.val)
    
    if node.left_ptr == nil && node.right_ptr == nil {
        globalBox.append(currentSlate)
    }
    
    if let left = node.left_ptr{
    dfs(node: left, slate: &currentSlate)
    }
    if let right = node.right_ptr{
    dfs(node: right, slate: &currentSlate)
    }
    
}
 


allPathsOfABinaryTree(root: root)

//: [Next](@next)

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
    var pathLength = 0
    dfs(node:root, slate: &slate, pathLength: &pathLength)
    print(globalBox)
    return globalBox
    
}

func dfs(node: TreeNode, slate: inout [Int], pathLength: inout Int) {
    //print(pathLength)

    
    
if node.left_ptr == nil && node.right_ptr == nil {
        globalBox.append(slate)
        
    }
    
        if let left = node.left_ptr {
            //pathLength += 1
            print("Going left: \(left.val) slate: \(slate) Pathlenth: \(pathLength)")
            goLeft(node: left, slate: &slate, pathLength: &pathLength)
            
        }
        
        if let right = node.right_ptr{
            //pathLength += 1
            print("Going Right: \(right.val) slate: \(slate) Pathlenth: \(pathLength)")
            goRight(node: right, slate: &slate, pathLength: &pathLength)
           
        }
 
    
   
    
}

func goLeft(node: TreeNode, slate: inout [Int], pathLength: inout Int) {
    pathLength += 1
    dfs(node: node, slate: &slate, pathLength: &pathLength)
    
}

func goRight(node: TreeNode, slate: inout [Int], pathLength: inout Int) {
    pathLength += 1
    dfs(node: node, slate: &slate, pathLength: &pathLength)
    
}

allPathsOfABinaryTree(root: root)

//: [Next](@next)

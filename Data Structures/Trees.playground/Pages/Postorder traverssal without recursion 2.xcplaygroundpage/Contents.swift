//: [Previous](@previous)

import Foundation

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

var parentStack = Stack<TreeNode>()
var leftStack = Stack<TreeNode>()
var rightStack = Stack<TreeNode>()
var result = [Int]()

func postOrder(root: TreeNode) -> [Int]? {
    guard let root = root else { return nil}
    
    if root.left_ptr == nil && root.right_ptr == nil {
        result.append(root.val)
        if let parent = parentStack.peek {
            if let right = parent.right_ptr {
                rightStack.push(right)
                leftCheck(node: right)
            }
        }
    } else {
        parentStack.push(root)
        
        if let left = root.left_ptr {
            leftStack.push(left)
            leftCheck(node: left)
        }
        
        if let right = root.right_ptr {
            
        }
        
        
    }
}

func leftCheck(node: TreeNode) {
    guard let node = node else { return }
    if let left  = node.left_ptr {
        parentStack.push(node)
        leftStack.push(left)
        postorder(root:left)
    }
    
    
    
}



//: [Next](@next)

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



func postOrder(root: TreeNode) -> [Int]? {
    print("hello")
    var stack = Stack<TreeNode>()
    var result = [Int]()
    guard let root = root else {
        return result
    }
    stack.push(root)
    var prev:TreeNode? = nil
    
    repeat {
        var current: TreeNode? = stack.peek()
        
        if prev == nil || prev!.left_ptr == current || prev!.right_ptr == current {
            if current?.left_ptr != nil {
                stack.push(current!.left_ptr!)
            } else if current!.right_ptr != nil {
                stack.push(current!.right_ptr!)
            } else {
                stack.pop()
                result.append(current!.val)
            }
        } else if current!.left_ptr! == prev {
            if current!.right_ptr != nil {
                stack.push(current!.right_ptr!)
            } else {
                stack.pop()
                result.append(current!.val)
            }
        } else if current!.right_ptr == prev {
            stack.pop()
            result.append(current!.val)
        }
        prev = current
    } while stack.storage.count != 0
    return result
}

postorder(root:root)



//: [Next](@next)

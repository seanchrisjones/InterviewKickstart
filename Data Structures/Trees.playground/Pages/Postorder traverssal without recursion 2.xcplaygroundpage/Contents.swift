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



func PostOrder(root: TreeNode?) -> [Int]? {
    print("hello")
    var stack = Stack<TreeNode>()
    var result = [Int]()
    guard let root = root else {
        return result
    }
    stack.push(element: root)
    var prev:TreeNode? = nil
    
    repeat {
        var current: TreeNode? = stack.peek()
        
        if prev == nil || prev?.left_ptr?.val == current!.val || prev?.right_ptr?.val == current!.val {
            if current?.left_ptr != nil {
                stack.push(element: current!.left_ptr!)
            } else if current!.right_ptr != nil {
                stack.push(element: current!.right_ptr!)
            } else {
                stack.pop()
                result.append(current!.val)
            }
        } else if current!.left_ptr!.val == prev!.val {
            if current!.right_ptr != nil {
                stack.push(element: current!.right_ptr!)
            } else {
                stack.pop()
                result.append(current!.val)
            }
        } else if current!.right_ptr!.val == prev!.val {
            stack.pop()
            result.append(current!.val)
        }
        prev = current
    } while stack.storage.count != 0
    return result
}

PostOrder(root:root)

/*
 ALGORITH EXPLANATION
 
 1.1 Create an empty stack
 2.1 Do the Following while root is not  nil
    - push root's right child onto the stack and then push root onto the stack
    - set root's left child as root
 2.2 Pop an item from the stack andd set it as root
    - If the popped item has a right child and the right child is at the top of the stack, then remove the child from the stack, push the root back onto the stack, and set the root as the root's right child.
    - Else set the root to nil
 2.3 repeat steps 2.1 and 2.2 while stack is not empty.
 
 **/



//: [Next](@next)

import Foundation

class TreeNode<T> {
    var key: Int
    var value: T
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    init (_ value: T, _ key: Int) {
        self.value = value
        self.key = key
    }
}

extension TreeNode where T: Comparable {
    
    
    func search(root: TreeNode, value: T) -> TreeNode? {
        if root == nil {
            return nil
        }
        var current = root
        while current != nil {
            if value == current.value {
                return current
            } else if value < current.value {
                current = current.leftChild!
            } else {
                current = current.rightChild!
            }
        }
        return nil
    }
    
    func insert(root: TreeNode, value: T, key: Int) -> TreeNode {
        var newNode = TreeNode(value, key)
        if root == nil {
            return newNode
        }
        var current = root
        var previous: TreeNode? = nil
        while current != nil {
            if newNode.value < current.value { // comparing the value of the new node with that of the current node
                if  current.leftChild != nil {
                    previous = current// update previous variable
                    current = current.leftChild!
                } else {
                    current.leftChild = newNode
                    return newNode
                }
            } else {
                if current.rightChild != nil {
                    previous = current
                    current = current.rightChild!
                } else {
                    current.rightChild = newNode
                    return newNode
                }
            }
        }
        
        return root
    }
    
    
    func findMin(root: TreeNode) -> TreeNode? {
        if root == nil {
            return nil
        }
        var current = root
        while current.leftChild != nil {
            current = current.leftChild!
        }
        return current
    }
    
    func findMax(root: TreeNode) -> TreeNode? {
        if root == nil { return nil}
        var current = root
        while current.rightChild != nil {
            current = current.rightChild!
        }
        return current
    }
    
    func successor(root: TreeNode, p: TreeNode) -> TreeNode? {
        if let foundP = root.search(root: root, value: p.value) {
            print("Found P")
            if root == nil {
                return nil
            }
            if foundP.rightChild != nil {
                var current = foundP.rightChild
                while current?.leftChild != nil{
                    current = current?.leftChild
                }
                return current
            } else {
                var ancestor: TreeNode? = nil
                var current = root
                while current.key != foundP.key {
                    if foundP.key < current.key {
                        if current.leftChild != nil {
                            ancestor = current
                            current = current.leftChild!
                        }
                    } else {
                        if current.rightChild != nil {
                            current = current.rightChild!
                        }
                    }
                }
                return ancestor
            }
        }
        return nil
    }
    
    
    func predecessor(root: TreeNode, p: TreeNode) -> TreeNode? {
        
        if let foundP = root.search(root: root, value: p.value) {
            print("Found P")
            if root == nil {
                return nil
            }
            if foundP.leftChild != nil {
                var current = foundP.leftChild
                while current?.rightChild != nil{
                    current = current?.rightChild
                }
                return current
            } else {
                var ancestor: TreeNode? = nil
                var current = root
                while current.key != foundP.key {
                    if foundP.key < current.key {
                        if current.leftChild != nil {
                            ancestor = current
                            current = current.leftChild!
                        }
                    } else {
                        if current.rightChild != nil {
                            current = current.rightChild!
                        }
                    }
                }
                return ancestor
                
            }
        }
        return nil
    }
    
    func delete(root: TreeNode, del: TreeNode) -> TreeNode? {
        // There are 3 cases for deletion: leaf node, node with 1 child, node with 2 children
        if let foundDel = root.search(root: root, value: del.value) {
            print("found Del")
            var previous: TreeNode? = nil
            var current = root
            while current != nil {
                if foundDel.key == key {
                    break
                } else if foundDel.key < current.key {
                    if current.leftChild != nil {
                        previous = current
                        current = current.leftChild!
                    }
                } else {
                    if current.rightChild != nil {
                        previous = current
                        current = current.rightChild!
                    }
                }
            }
            if current == nil {
                return root
            } else if current.leftChild == nil && current.rightChild == nil {
                if current.value == previous?.leftChild?.value {
                    previous?.leftChild = nil
                } else if previous == nil{
                    return nil
                }
            } else {
                previous?.rightChild == nil
                return root
            }
        }
        return root
    }
  
}

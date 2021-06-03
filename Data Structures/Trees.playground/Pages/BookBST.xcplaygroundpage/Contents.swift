//: [Previous](@previous)

import Foundation

public struct BinarySearchTree<Element: Comparable> {
    public private(set) var root: BinaryNode<Element>?
    public init (){}
    
    
}

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    
    /**
     In order Traversal starts witht he root node and  if it has a left child will visit that child first recusively before visiting the root
     Then it will visit the right child recursively
     This will will visit the nodes in sorted order
     */
    
    
    public func traverseInOrder( visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    // Visits the parent node first then will recursively visit the left and right children
    public func traversePreorder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreorder(visit: visit)
        rightChild?.traversePreorder(visit: visit)
    }
    
    // Visits the current node only after the left and right children have been visited
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
    }
    
    
    }




extension BinarySearchTree {
    public mutating func insert(_ value: Element) {
        root = insert( from: root, value: value)
    }
    
    private func insert( from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        if value < node.value  {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
    
    public func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
    
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value == node.rightChild!.min.value
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}



//public protocol Queue {
//    associatedtype Element
//    mutating  func push(_ element: Element) -> Bool
//    mutating func pop() -> Element?
//    var isEmpty: Bool {get}
//    var peek: Element{get}
//}


public struct QueueArray<T> {
    private var array: [T] = []
    public init(){}
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    
    public var peek: T? {
        array.first
    }
    
    public mutating func push(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func pop() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray {
    public var count: Int {
        array.count
    }
}

extension QueueArray : CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}

func bfs( root: BinaryNode<Int>) -> [[Int]]? {
    if root == nil {
        return nil
    }
    var q = QueueArray<BinaryNode<Int>>()
    q.push(root)
    var result = [[Int]]()
    while !q.isEmpty {
        var numNodes = q.count
        var temp = [Int]()
        
        repeat {
            while let node = q.pop() {
                temp.append(node.value)
                if node.leftChild != nil {
                    q.push(node.leftChild!)
                }
                if node.rightChild != nil {
                    q.push(node.rightChild!)
                }
                //print(temp)
                result.append(temp)
                numNodes -= 1
            }
            
        }while numNodes > 0
        
    }
    return result
}


var root = BinaryNode( value: 7)
root.rightChild = BinaryNode( value: 9)
root.leftChild = BinaryNode( value: 6)
bfs(root: root)


func dfs(node: BinaryNode<Int>, target: Int) -> Bool {
    // base Case leaf node
    var result = false
    if node.leftChild == nil && node.rightChild == nil {
        if target == node.value {
            print("true")
            result = true
        }
    } else {
        // recursive case: internal node
        if node.leftChild != nil {
         return dfs(node: node.leftChild!, target: target)
        }
        
        if node.rightChild != nil {
        return dfs(node: node.rightChild!, target: target) || result
        }
    }
    return result
}

var BTRoot = BinaryNode(value: 10)

//print(DFSTree.root!.leftChild!.value)





//: [Next](@next)

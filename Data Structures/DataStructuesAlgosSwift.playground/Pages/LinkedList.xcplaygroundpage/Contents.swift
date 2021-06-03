//: [Previous](@previous)

import Foundation

/*
 LINKED LISTS
 
 a linked list is a collection of values arranged in a linear unidirectional sequence.
 
 - Constant time insertion
 - Reliable performance characteristics.
 
 A Linked list is a chain of nodes
 Nodes have 2 responsibilities
    - hold a value
    - hold a reference to the next node. a nil value represents the end of a list.
 
 ADDING VALUES TO THE LIST:
 
    PUSH()- ADDS A VALUE TO THE FRONT OF THE LIST - O(1)
    APPEND()- ADDS A VALUE TO THE END OF THE LIST - O(1)
    INSERTAFTER()- ADDS A VALUE AFTER A PARTICULAR NODE OF THE LIST - O(1)
    NODE(AT:) - Returns a node a certain index - O(i)  where i is the given index
 
 REMOVING VALUES FROM THE LIST:
 
    POP()- REMOVES THE VALUE AT THE HEAD OF THE LIST - O(1)
    REMOVELAST() - REMVOES THE VALUE AT THE TAIL OF THE LIST - O(n)
    REMOVEAFTER() - REMOVE THE IMMEDIATE NEXT NODE - 0(1)
 
 SWIFT COLLECTION PROTOCOLS:
 
 The swift standard library has a set of protocols that help define what's expected of a particular type.  Each of these protocols provides certain guarantes on characteristics and performance.  Of these sets of protocols, 4 are referred to as collection protocols
 
 - Tier 1 Sequence: a Sequence  type provides  sequential access to tis elements.  This axiom comes with a caveat: using the sequential access may destructively consume the elements
 
 - Tier 2: Collection - a collection is a sequence typr that provides additional guarantees. A collection is finite and allows for repeated and non destructive sequential access
 - Tier 3: BidirectionalCollection: a collection type can be a bidrectional collection type,as the name suggests, can all for bidrectional travel up and down the sequence.  This isn't possile for the linked list since you may only travel from the head tot he tail.
 
 - Tier 4: RandomAccessCollectionr - A bidirectional type can be a random access collection type if it can guarantee that accesing an element at a particular index will  take just as long as accessing an element at any other index.   THis is not possible for the linked list since accessing a node at the ehad of the list is faster than accessing a node further down the list.
 
 
 
 
 
 
 
 **/

public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return  "\(value) -> " + String(describing: next) + ""
    }
}

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Value) {
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        
        copyNodes()
        guard !isEmpty else {
            push(value)  // check to see if the list is not empty if it is add the new node to the front of the list
            return
        }
        
        tail!.next = Node(value: value) // there must be a tail make the new node the next value for the tail
        tail = tail!.next // now make the new value the tail
    }
    
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
        
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        copyNodes()
        guard tail !== node else {
            append(value) // make sure that we are not adding a new node after the tail.  If we are just append the new value
            return tail!
        }
        node.next = Node(value: value, next: node.next) // once we find  find the node we're looking for change it's next reference tot he new value
        return node.next! // return the node.next which should now be out new value
    }
    
    public mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        copyNodes()
        guard let head = head else {
            return nil // make sure that there is something in the list
            }
        guard head.next != nil else {
            return pop() // make sure that head has a next value else just pop() head  because it is the last value
        }
        
        var prev = head // previous node is head
        var current = head // the current node is the head
        
        while let next = current.next { // while there is a next value let the next value for the current node be called next
            prev = current // previous will be the current node
            current = next // current becomes the next node as we're moving through the list until the next node is nil
        }
        prev.next = nil // since the current node is the last node. Disconnect it using pev.next  then update the tail
        tail = prev
        return current.value
        
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        guard let node = copyNodes(returningCopyOf: node ) else {
            return  nil
        }
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        tail = newNode
    }
    
    private mutating func copyNodes( returningCopyOf node: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        guard var oldNode = head else {
            return nil
        }
        
        head = Node( value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node( value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        return nodeCopy
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "empty list"
        }
        return String(describing:head)
    }
}

extension LinkedList: Collection {
   
    public struct Index: Comparable {
    
    public var node: Node<Value>?
    
    static public func == (lhs: Index, rhs: Index) -> Bool {
    switch (lhs.node, rhs.node) {
    case let (left?, right?):
        return left.next === right.next
    case (nil, nil):
        return true
    default:
        return false
    
    }
    }
    
    static public func <(lhs: Index, rhs: Index) -> Bool {
    
        guard lhs != rhs else {
            return false
        }
        let nodes = sequence(first: lhs.node) { $0?.next }
        return nodes.contains {$0 === rhs.node }
    }
    
    }
    
    public var startIndex: Index {
        Index(node: head)
    }
    
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        position.node!.value
    }
}

//: [Next](@next)

var list = LinkedList<Int>()

list.push(3)
list.push(2)
list.push(1)
print("before Inserting: \(list)")
var middleNode = list.node(at: 1)!
for _ in 1...4{
    middleNode = list.insert(-1, after: middleNode)
}
print("after inserting: \(list)")


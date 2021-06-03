import Foundation

public class Node<T> {
    public var value: T
    public var next: Node<T>?
    public var previous: Node<T>?
    
    public  init(_ value: T) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        String(describing: value)
    }
}


public class DoublyLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool { head == nil}
    public var first: Node<T>? {
        head
    }
    
    public func append(_ value: T) {
        let newNode = Node(value)
        guard let tailNode = tail else {
            head = newNode
            tail = newNode
            return // Check to see if there is a tail if the newNode is both the head and tail of a new list
        }
        newNode.previous = tail
        tailNode.next = newNode
    }
    
    
    public func remove(_ node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        node.previous = nil
        node.next = nil
        return node.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    
    public var description: String {
        var string = ""
        var current = head
        while let node = current {
            string.append("\(node.value) ->")
            current = node.next
        }
        
        return string + "end"
    }
    
}

public class LinkedListIterator<T>: IteratorProtocol {
    private var current: Node<T>?
    init (node: Node<T>?) {
        current = node
    }
    
    public func next() -> Node<T>? {
        defer {
            current = current?.next
        }
        return current
        
    }
}

extension DoublyLinkedList: Sequence {
    public func makeIterator() -> LinkedListIterator<T> {
        LinkedListIterator(node: head)
    }
}

//public protocol Queue {
//    associatedtype Element
//
//    mutating func enqueue(_ element: Element) -> Bool
//
//    mutating func dequeue() -> Element?
//
//    var isEmpty: Bool {get}
//
//    var peek: Element? {get}
//}
//
public class QueueLinkedList<T>: Queue {
    
    private var list = DoublyLinkedList<T>()
    public init() {}
    
    
    public var peek: T? {
        list.first?.value
    }
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }
    
}

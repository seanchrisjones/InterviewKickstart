import Foundation

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init (_ value: T) {
        self.value  = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}
struct Queue<Element> {
    var elements: [Element] = []
    
    mutating func enqueue(_ value: Element) -> Bool {
        elements.append(value)
        return true
        
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

extension TreeNode {
    //Depth First Traversal: A technique that staarts at the root node and visits each node as deep as it can before backtracking
    
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
                                  visit(self)
                                  children.forEach {
                                  $0.forEachDepthFirst(visit: visit)
                                  }
    }
    
    
    //BREADTH FIRST TRAVERSAL - LVL ORDER TRAVERSAL
    public func forEachLevelOrder(visit: (TreeNode) -> Void ) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach{queue.enqueue($0)}
        while let node = queue.dequeue(){
            visit(node)
            node.children.forEach{queue.enqueue($0)}
        }
    }
    
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder{ node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}






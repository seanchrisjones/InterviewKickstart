import Foundation

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element){
        self.value = value
        
        
    }
}

extension BinaryNode {
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreorder(visit: (Element)-> Void) {
        visit(value)
        leftChild?.traversePreorder(visit: visit)
        rightChild?.traversePreorder(visit: visit)
    }
    
    public func traversePostorder(visit: (Element) -> Void) {
        leftChild?.traversePostorder(visit: visit)
        rightChild?.traversePostorder(visit: visit)
    }
}

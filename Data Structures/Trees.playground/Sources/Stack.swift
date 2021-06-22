import Foundation

public struct Stack<Element> {
    public var storage: [Element] = []
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public mutating func push(element: Element) {
        storage.append(element)
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

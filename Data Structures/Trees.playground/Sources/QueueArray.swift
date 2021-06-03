import Foundation

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


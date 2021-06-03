//: [Previous](@previous)

import Foundation
/*
 STACKS
 
 stacks are crucial to problems that search trees and graphs
 Stacks are a LIFO structure
 Always inserting and pulling from the top of the stack
 
 **/

public struct Stack<Element> {
    private var storage: [Element] = []
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
        
    }
    
    public func peek() -> Element? {
        storage.last
        
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
    public init(_ elements: [Element]) {
        storage = elements
    }
}

extension Stack: CustomStringConvertible  {
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)"}.reversed().joined(separator: "\n"))
        ----
        """
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

var stack3: Stack = [1.0, 2.0, 3.0, 4.0]
print(stack3)
stack3.pop()


var ints = [1,2,3,4]
var stack = Stack<Int>(ints)
print(stack)
if let poppedElement = stack.pop() {
    assert(4 == poppedElement)
    print("popped: \(poppedElement)")
    
}


let array = ["A", "B", "C", "D"]
var stack2 = Stack(array)
print(stack2)
print(stack2)
stack2.pop()


/*
 CHALLENGES
 
 
 
 **/

//REVERSE AN ARRAY

func reverseArray(_ array: [Int]) {
    var reversed = Stack<Int>()
   
    for i in 0...array.count-1{
        reversed.push(array[i])
    }
    print(reversed)
    
}
reverseArray([1,2,3,4])
//: [Next](@next)

/*
 Balance Parentheses
 **/

func balancedParentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")"{
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
    }
        
}
    return stack.isEmpty
}
balancedParentheses("(hello)")


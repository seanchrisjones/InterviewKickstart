import Foundation

/*
 RING BUFFER IMPLEMENTATION
 
 - A RING BUFFER ALSO KNOW AS A CIRCULAR BUFFER IS A FIXED SIZE ARRAY.
 - THIS DATA STRUCTURE STRATEGICALL WRAPS AROUND TO THE BEGINNING  WHEN THERE ARE NO MORE ITEMS TO REMOV AT THE ENF.
 
 **/

public struct RingBuffer<T> {
    private var array: [T?]
    private var readIndex = 0
    private var writeIndex = 0
    private var availableSpaceForReading: Int{ writeIndex - readIndex}
    private var availableSpaceForWriting: Int { array.count - availableSpaceForReading}
    public var isEmpty: Bool { availableSpaceForReading == 0}
    public var isFull: Bool {availableSpaceForWriting == 0}
    
    public  init(_ count: Int) {
        array = Array<T?>( repeating: nil, count: count)
    }
    
    public var first: T? {
        array[readIndex]
    }
    
    
    
    public mutating func write(_ element: T) -> Bool {
        if isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
        
    }
    
    public mutating func read() -> T? {
        
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
        
    }
}

extension RingBuffer: CustomStringConvertible {
    public var description: String {
      let values = (0..<availableSpaceForReading).map {
        String(describing: array[($0 + readIndex) % array.count]!)
      }
      return "[" + values.joined(separator: ", ") + "]"
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
//    var peek: Element {get}
//}





public struct QueueRingBuffer<T>: Queue {
    private var ringBuffer: RingBuffer<T>
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count)
    }
    
    public var isEmpty: Bool{
        ringBuffer.isEmpty
    }
    
    public var peek: T? {
        ringBuffer.first
        
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        ringBuffer.read()
    
    }
    
    
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        String(describing: ringBuffer)
    }
}

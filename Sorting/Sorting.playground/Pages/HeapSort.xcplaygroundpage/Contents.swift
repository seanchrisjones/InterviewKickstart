//: [Previous](@previous)

import Foundation

struct Heap <Element: Equatable> {
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    init(sort: @escaping (Element, Element) -> Bool, elements:[Element] = []) {
          self.sort = sort
        self.elements = elements
        if !elements.isEmpty{
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
                
            }
          }
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        ( 2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1 ) / 2
    }
    
    mutating func remove() -> Element? {
        guard !isEmpty else { //1
            return nil
        }
        elements.swapAt(0, count - 1)// 1
        defer {
            siftDown(from: 0)// 4
            
        }
        return elements.removeLast()//3
    }
    /*
     REMOVE FUNCTION IMPLEMNTATION EXPLANATION
     1- check to see  if the heap is empty, if so return nil
     2- swap the root with the last element in the heap
     3- remove the last element (min/max value) then retuen it
     4- the heap may not satisfy the Heap variant so you will have to perform a sft down to make sure that it conforms to the rule
     **/
    
    
    
    
    
    mutating func siftDown (from index: Int, upTo: Int) {
        var parent = index //1
        while true { // 2
            let left = leftChildIndex(ofParentAt: parent)//3
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left // 5
            }
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right  //6
            }
            
            if candidate == parent {
                return //7
            }
            elements.swapAt(parent, candidate)//8
            parent = candidate
        }
        
        
            
        }
    
    mutating func remove( at index: Int) -> Element?{
        guard index < elements.count else {
            return nil
        }
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count-1)
            defer {
                siftDown(from: index, upTo: elements.count-1)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }
        
        func index( of element: Element, startingAt i: Int) -> Int? {
            if i >= count {
                return nil
            }
            if sort(element, elements[i]){
                return nil
            }
            
            if element == elements[i] {
                return i
            }
            if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
                return j
            }
            if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
                return j
            }
            return nil
            
        }
        
    
    
    /*
     SIFT DOWN IMPLEMENTATION EXPLANATION
     1- store the parent index
     2- continue sifting  until you return
     3- get the parents left and right child index
     4- the candidate Varianle is used to keep track of which index to swap with the parent
     5- if there  is a a left child, and it has a higher priority than its parent make it the candidate
     6- if there is a right child, and it has an even greater priority, it will be come the candidate instead
     7- if candidate is still parent, you have reached the end and no more sifting is required
     8- swap candidate with parent and set it as the new parent to continue sifting
     
     **/
    
    
    /*
     INSERTING INTO A HEAP
     to add a value to a heap, you first put the value at the end and perform a sift up
     **/
    
    
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    
    mutating func siftUp( from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort( elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    /*
     INSERTION AND SIFT UP IMPLEMENTATION EXPLANATION
     
     - The insert function adds the element to the end of the array Then calls sift up.
     - the child variable is assigned to the last element of the array
     - the parent variable is assigned to the index using the parentIndex method
     - While the index of the child variable is greater  than 0 && sort the sort the values
     **/
}

extension Heap {
    func sorted() -> [Element] {
        var heap = Heap(sort: sort, elements: elements)//1
        for index in heap.elements.indices.reversed() {//2
            heap.elements.swapAt(0, index)//3
            heap.siftDown(from: 0, upTo: index)//4
        }
        return heap.elements
    }
}



/*
    HEAP SORT IMPLEMENTATION EXPLANATION
    1- You first make a copy of the heap.  Ater heapSort sorts the elements array, it is no longer a valid heap.  By working on a copy of the heap, you make sure that th heap remains valid
    2- you loop through the array starting with the last element
    3- you swap the first and last element .  This moves the largest unsorted element to its corect sp2ot
    4- Because the heap is now invalid, you must sift down the new root node as a resuly. The next largest element will become the new root.
 **/

//: [Next](@next)

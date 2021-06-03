import Cocoa


/*
 HEAPS
 Heaps ,also know as binary heaps, are complete binary trees that be constructed using an array
 - Heaps come in two types max and min
 - MAX: elements with a higher value have a higher priority
 - MIN: elements with a low value have a higher priority
 
 The heap has important properties that must ALWAYS be satisfied. The HEAP VARIANT / HEAP PROPERTY
 - MAX: parent nodes must always contain a value that is greater than or equal to the value in its children
 - MIN: parent nnodes must always contain a value that is greater than or equal to the value in its children
 
 Another important property of a heap is that is is complete meaning that every level must be filled except the last level
 
 
 HEAP APPLICATION
 - Calculating the minimum or maximum element of a collection
 - heap sort
 - constructing a priorty queue
 - constreucting graph algorithms, Like Prim's Djikstra's with a priority queue
 
 Heaps are binary trees, but they can be represented with an array giving the efficient time and space complexity
 finding the left and right child for each element is easy
 rightChild = 2i + 1
 leftChild = 2i + 2
 findParent = i-1/2
 where i is equal to the index of the parent node.
 
 
 HEAP OPERATIONS
 
 
 REMOVE: a remove operation will remove the maximum value at the root node (max heap) to do so you must first swap the root node with the last element  in the heap. Once you've swapped the two elements, you can remove the last element and store its value so you can later return it. Then you must check to see if the Heap Variant is still satified
 **/

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
    
    
    
    
    
    mutating func siftDown (from index: Int) {
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
                siftDown(from: index)
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

var nums = [5,9,2,3,1,4,8,7,5,0,10,100]
var heap = Heap(sort: >, elements: nums)
while !heap.isEmpty {
    print(heap.remove()!)
}

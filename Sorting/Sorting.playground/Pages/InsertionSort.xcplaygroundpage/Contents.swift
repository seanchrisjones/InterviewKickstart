//: [Previous](@previous)

import Foundation

func insertionSort(_ array: inout [Int]) {
    guard array.count >= 2 else {
        return
    }
    //1
    for current in 1..<array.count {
        for shifting in (1...current).reversed(){
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
    
}
var nums = [5,9,2,3,1,4,8,7,5,0,10,100]
insertionSort(&nums)

/*
 QUESTION
 How is insertion sort different form bubble sort?
 it  compares adjacent values and swaps them until they are all in the right place.
 
 ANSWER:
 insertion sort is different in the way that the collection size grows as we iterate
 first it will start as a collection of size two put those elements in order then add element 3 and so on.
 
 **/

func recursiveInsertion(_ array: inout [Int], _ n: inout Int) {
    
}

recursiveInsertion(&array, array.count) {
    if n <= 1 {
        return
    }
    recursiveInsertion(&nums, &n-1)
    var nth = array[n]
    var j = n-1
    
    while j >= 1 && array[j] > nth {
        array[j+1] = array[j]
        j = j-1
    }
    array[j+1] = nth
    print(array)
}

//recursiveInsertion(&nums, &array.count)

//: [Next](@next)

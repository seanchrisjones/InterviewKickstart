//: [Previous](@previous)

import Foundation

/*
 given an array: arr, and an Int K return the k Largest elements of that array
 
 
 STEPS
 
- check to see if the array has 2 elements or less. If so return the sorted array
- Partition the array everything smaller than the pivot element going to the left everything larger to the right
- At this point the pivot should be in the correct spot
-
 **/

func kLargest(_ arr: [Int], _ k: Int) -> [Int] {
    
    var new = arr
    if new.count <= 2{
        return arr
    } else {
      new = quickSelectLomuto( &new, low: 0, high: new.count-1, k: k)
        
    }
    return new
}

public func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high] // 1
    
    var i = low // 2
    for j in low..<high { //3
        if a[j] <= pivot { //4
            a.swapAt(i, j)//5
            i += 1
        }
    }
    a.swapAt(i, high)//6
    return i // 7
    
}

public func quickSelectLomuto(_ a: inout [Int], low: Int, high: Int, k: Int) -> [Int] {
    
    if low < high {
        let pivot = partitionLomuto(&a, low: low, high: high)
        
        if a(indexOf: pivot) > a.count - k {
            quicksortLomuto(&a, low: pivot+1, high: high)
            
        } else {
            quicksortLomuto(&a, low: low, high: pivot-1)
            
        }
        
    }
    print(a)
    return a
}


public func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high  {
        let pivot = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: pivot-1)
        quicksortLomuto(&a, low: pivot+1, high: high)
    }
}
var nums = [5,100,2,3,1,4,8,7,5,0,10,9]
kLargest(nums,4)


//: [Next](@next)

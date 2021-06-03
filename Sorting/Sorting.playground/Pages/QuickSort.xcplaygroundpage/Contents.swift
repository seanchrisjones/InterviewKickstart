//: [Previous](@previous)

import Foundation


public func quicksortNaive<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else {
        return a
    }
    let pivot = a[a.count / 2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot}
    let greater = a.filter { $0 > pivot}
    return quicksortNaive(less) + equal + quicksortNaive(greater)
}
/*
 NAIVE QUICKSORT IMPLEMENTATION EXPLANANTION
 - First, we are making sure that the input collection has more than one element  if not we return the collection as is
 - Second, we are determinging our pivot by selecting the element at the middle index of the collection
 - Third, we are creating threee auxillary arrays to store values less than, equal to, and greater than our pivot.
 - Lastly, we are quick sorting our less and greater partitions further and then returning a sorted array.
 
 **/
var nums = [5,9,2,3,1,4,8,7,5,0,10,100]
quicksortNaive(nums)




public func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int  {
    let pivot = a[high] //1
    var i  = low // 2
    for j in low..<high{ // 3
        if a[j] <= pivot { // 4
            a.swapAt(i,j)// 5
            i += 1
        }
    }
    a.swapAt(i, high) // 6
    return i // 7
}



/*
 LOMUTO'S PARTITIONING IMPLEMENTATION EXPLANATION
 
 1- Set the pivot. Lomuto always chooses the last element as the pivot
 2- The variable i indicates how many elements are less than the pivot.  Whenever yo encounter an element that is less thn the pvot you swap it with the element at index i and increment i
 3- loop thru all the elements from low to high but not including high since it is the pivot
 4- Check to see if the current element is less than or equak tot he pivot.
 5- if it is swap it with the element at i and increment i
 6- once done with tthe lops swap the element at i with the pivot. The pivot always sits between the less and greater partitions.
 
 Lomuto's partition uses no auxillary space and performs in O(n) Linear Time.
 
 **/

public func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivot = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: pivot - 1)
        quicksortLomuto(&a, low: pivot + 1, high: high)
    }
}

quicksortLomuto(&nums, low: 0, high: nums.count - 1)


public func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low] //1
    var i = low - 1 // 2
    var j = high + 1
    
    while true {
        repeat { j -= 1} while a[j] > pivot //3
        repeat { i += 1} while a[i] < pivot // 4
        
        if i < j { // 5
            a.swapAt(i, j)
        } else {
            return j //6
        }
    }
    
}
 /*
HOARE'S PARTITION IMPLEMENTATION EXPLANATION
 
 1- select the firt element as the pivot
 2- indexes i and j define two region.  Every index befor i will be less than or equl to the pivot.  Every index after j will be greater than or equal  to the pivot.
 3- Decrease j until it reaches an element that is not greater than the pivot
 4- increase i until it reaches an element that is not less than the pivot.
 5- if i and j have not overlapped, swap the elements
 6- return the index that separates both regions
 
 
 **/

/*
 IMPORTANT NOTE
 It is very important to recognize that both partitioning algorithms are return an integer that is the INDEX not the value store at the index!!!
 **/


public func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quicksortHoare(&a, low: low, high: p)
        quicksortHoare(&a, low: p + 1, high: high)
    }
}

quicksortHoare(&nums, low: 0, high: nums.count-1)


public func medianOfThree<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let center = (low + high) / 2
    if a[low] > a[center] {
        a.swapAt(low, center)
    }
    if a[low] > a[high] {
        a.swapAt(low, high)
    }
    if a[center] > a[high]{
        a.swapAt(center, high)
    }
    return center
}

public func quicksortMedian<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = medianOfThree(&a, low: low, high: high)
        a.swapAt(pivotIndex, high)
        let pivot = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: 0, high: pivot-1)
        quicksortLomuto(&a, low: pivot+1, high: high)
        
    }
    
}

quicksortMedian(&nums, low: 0, high: nums.count-1)

/*
 MEDIAN OF THREE IMPLEMENTATION EXPLANATION
 Median of three makes sure that you are not selecting the lowest or highest value of the collection.
 - First we find the center index by dividing the collection count-1 / 2
 - Initially our low will be the 0 index. if the element at [0] is greather than the value at [center] we swap them
 - Then, we check to see if the value at [low] is greater than the value at [high] if so we swap them
 - Finally,  we'll check to see if the value at center is greater than the value at high if so we'll swap them
 - Now, we'll return the integer of the center index NOT THE VALUE!!!
 
 -Now that we know that our value at the center index is NOT the largest or smallest value, we'll swap that with the value at the beginning or end depending on which sorting algorithm you're using.
 
 **/


public func partitionDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) {
    let pivot = a[pivotIndex]
    var smaller = low
    var equal = low
    var larger = high
    
    while equal <= larger {
        if a[equal] < pivot {
            a.swapAt(smaller, equal)
            smaller += 1
            equal += 1
        } else if a[equal] == pivot {
            equal += 1
        } else {
            a.swapAt(equal, larger)
            larger -= 1
        }
    }
    return (smaller, larger)
}

public func quicksortDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let (middleFirst, MiddleLast) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: high)
        quicksortDutchFlag(&a, low: low, high: middleFirst-1)
        quicksortDutchFlag(&a, low: MiddleLast+1, high: high)
    }
}
quicksortDutchFlag(&nums, low: 0, high: nums.count-1)

//: [Next](@next)

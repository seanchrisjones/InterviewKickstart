//: [Previous](@previous)

import Foundation

public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    guard array.count > 1 else {
        return array
    }
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    return merge(left, right)
}

private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
    var leftIndex = 0
    var rightIndex = 0
    var result: [Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if rightElement < leftElement {
             result.append(rightElement)
             rightIndex += 1
                
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
        }
    
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    return result
    }

/*
 IMPLEMENTATON EXPLANATION
 - IN the main function you begin by splitting the collection in half, but this isnt enough we have to continue to split recursively  until we cannot split anymore. which is until each subdivision contains just one element.
 
 - Recursion needs a base case, which you can think of as an exit condition.  In this case, the base case is when the  array only has one element
 
 - We are now calling mergeSort on the left and right halves of our original array. We will then split those halves in half.
 
 - the final ste p is to merge the left aand right halves together. to keep things clean we will do this in a separate merge function.
 
 - The sole responsibility of the merge function is to take in two sorted arrays and combine them while retaining sort order .
 
 - the leftIndex and rightIndex variables track your progress as you parse through the two arrays
 
 -  The result will house the the combined array
 
 - starting from the beginning , you compare the elements in the left and right arrays sequentially.  If you've reached the end of weither arry there is nothing else to compare.
 
- The smaller of the two elements goes into the result array. if they are equal they can both be added.
 
 = The first loop guarantees that either elft or right is empty. since both arrays are sorted, this ensures that the left over elements are greater than or equal to the one currently in result. you can append the elements without comparison
 
 **/
var nums = [[5,9,2],[3,1,4,8],[7,5,0,10,100]]
mergeSort(nums)
//: [Next](@next)

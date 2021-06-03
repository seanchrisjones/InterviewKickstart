//: [Previous](@previous)

import Foundation

/*
 Selection Sort is an O(n^2) sorting algorithm
 it's not very efficient and should be avoided in an interview
 Selection Sort works by  looping through a collection starting at the beginning.
 - It will assume that the number at the pointer is the smallest element
 - It will then perform a linear scan looking for a number that is smaller than the current.
 - If it finds one it will  mark that new element as the lowest and continue the scan to see if there is a element that is smaller still
 - Once it has completed the scan and found the smallest element in the range it will swap the element at the pointer with the element that was marked as the lowest.
 
 **/


func selectionSort(_ array: inout [Int])  {
    
        guard array.count >= 2 else {
            return
        }
       
        
        for current in 0..<array.count-1 {
            var lowest = current
            for other in ( current + 1 )..<array.count {
                if array[lowest] > array[other] {
                    lowest = other
                    
                }
            }
            if lowest != current {
                array.swapAt( lowest,current)
            }
        }
    
    print(array)
   
    
}
var nums = [5,9,2,3,1,4,8,7,5,0,10,100]
selectionSort(&nums)

//: [Next](@next)

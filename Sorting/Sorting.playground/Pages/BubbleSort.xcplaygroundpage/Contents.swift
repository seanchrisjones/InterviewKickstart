import Cocoa
/*
 BUBBLE SORT
 Bubble sort is one fo the simplest sorting algorithms.
 It compares adjacent values and if they are not in the correct order it swaps them
 **/

func bubbleSort(_ array: inout [Int]) {
    //1
        guard array.count >= 2 else {
            return
        }
    //2
        for end in (1..<array.count).reversed() {
            var swapped = false
            //3
            for current in 0..<end {
                if array[current] > array[current + 1] {
                    array.swapAt(current, current + 1)
                    swapped = true
                }
            }
            //4
            if !swapped {
                return
            }
        }
    }

/*
IMPLEMENTATION EXPLANATION
 1-  There is no need to sorth the  collection if there is less than 2 elements
 2-  A single pass will bubble the largest value to the end of the collection.  Every pass needs to compare one less value than in the previous pass , so essentially you shorthen the rray by one with each pass.
 3- This loop performs a single pass; it compares adjacent values and swaps them if needed
 4- if no values were swapped this pass, the collection must be sorted, and you can exit early.
 **/

var nums = [5,9,2,3,1,4,8,7,5,0,10,100]
bubbleSort(&nums)

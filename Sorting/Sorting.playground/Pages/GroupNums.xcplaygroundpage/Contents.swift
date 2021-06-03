//: [Previous](@previous)

import Foundation

func groupNums(_ arr: inout [Int]) -> [Int] {
    var isEven: Bool = false
    var i = 0
    var odd = arr.count - 1
    
    while i < odd {
        if arr[i] % 2 != 0 {
            isEven = false
            
            if arr[odd] % 2 == 0 {
                isEven = true
                arr.swapAt(i, odd)
                i += 1
                odd -= 1
            } else {
                odd -= 1
            }
        } else {
            i += 1
        }
    }
    return arr
    
}

var nums = [5,100,2,3,1,4,8,7,5,0,10,9]
groupNums(&nums)

//: [Next](@next)

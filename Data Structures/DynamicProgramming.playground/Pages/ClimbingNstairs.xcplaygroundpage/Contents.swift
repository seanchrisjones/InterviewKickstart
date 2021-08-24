//: [Previous](@previous)

import Foundation

/*
 A child is trying to climb a stai vase.  the maximum number of steps he can climb at a time is 2; that is; he can either climb 1 step or 2 steps at a time.  If there are n steps in total, in how many different ways can he climb the staircase?
 **/


func climbingStairs( _ n: Int) -> Int {
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }
    var storage = Array(repeating: 0, count: n+1)
    storage[1] = 1
    storage[2] = 2
    for i in 3...n {
        storage[i] = storage[i-1]+storage[i-2]
    }
    return storage[n]
}

climbingStairs(5)
// we can save space like in bottom up by using a smaller array of size 3 since this problem is pretty much identical
//: [Next](@next)

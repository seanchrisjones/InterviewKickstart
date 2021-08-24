//: [Previous](@previous)

import Foundation

func fib(_ num: Int) -> Int {
    if num == 0 || num == 1 {
        return num
    } else {
        return fib(num-1) + fib( num-2)
    }
}


fib(4)

// The baove code will run in exponential time. In my notebook I have a diagram explaining the DFS execution Tree of this function.
/*
 let's take fib(4) for example. At some point we'll be repeating work when we reach fib(2)
 if we store values that maybe repeated can be stored in a data structure... like a hashmap
 **/


var memo = [Int: Int]()
func dynamicFib(_ n: Int) -> Int {
    if (memo[n] != nil) {
        return memo[n]!
    } else if n == 0 || n == 1 {
        return n // we can remove this by adding the base cases/ leaf nodes to the memo  
    } else {
        memo[n] = fib(n-1) + fib(n-2)
        return fib(n-1) + fib(n-2)
    }
    
}

dynamicFib(4)

// When running the code on Fib(4) we can see that the basic fib function is running 10times
// the Dynamic fib code is running only once
//: [Next](@next)

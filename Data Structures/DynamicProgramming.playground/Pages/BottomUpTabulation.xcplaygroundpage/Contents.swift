import Cocoa

var table = [Int: Int]()
table[0] = 0
table[1] = 1

func bottomUpFib(_ n: Int) -> Int {
    for i in 2...n {
        table[i] = table[i-1]!+table[i-2]!
    }
    return table[n]!
}

bottomUpFib(4)

/*
 Above we are using an iterative approach to solve the fibonacci problem
 instead of the execution being a recursion tree we can think of it as a Dependency graph where each node is a unique operation unluke the recursion tree where we can have duplicate operations.
 - The dependency Graph is a directed Acyclic Graph (DAG)
 - We can perform a topological sort on a DAG
 - Since we already know fib of 0 and 1 we add them to our cache.
 -now when we're starting at 2 in our for loop we already have the  solutions to the subproblem that we need to solve fib(2)
 the space and time for this algo is o(n)
 - we can even improve the space complexity
 **/

var storage = Array(repeating: 0, count: 3)
func spaceSaverFib( _ n: Int) -> Int {
    storage[0] = 0
    storage[1] = 1
    
    for i in 2...n {
        if i % 3 == 0 {
            storage[0] = storage[2] + storage[1]
            
        } else if i % 3 == 1 {
            storage[1] = storage[0] + storage[2]
            
        } else if i % 3 == 2 {
            storage[2] = storage[1] + storage[0]
            
        }
    }
    return storage[n%3]
}
spaceSaverFib(10)
/*
 
 spaceSaverFib is improving our space complexity from linear space to a constant amount of space
 - because fib(n) = fib(n-1) + fib(n-2) we really only need an array of size 3 to get our answer and we can reuse the space as we iterate up to n
 **/

//: [Previous](@previous)

import Foundation

/*
 C(n,k) is the number of ways of choosing k elements out of a set of n elements
 c(n,K) = c(n-1,K) Exclude + C(n-1, K-1)Include
 
 **/


func chooseK(_ n: Int, _ k: Int) -> Int {
    if k == 0 || k == n {
        return 1
    }
    return chooseK(n-1,k) + chooseK(n-1,k-1)
}

chooseK(10,3)


func dynamicChooseK( _ n: Int, _ k: Int) -> Int {
    if k == 0 || k == n {
        return 1
    }
        var table = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
        for row in 0...n {
            table[row][0] = 1
          }
        for col in 0...k {
            table[col][col] = 1
        }
        for row in 2...n {
            for col in 1...min(row,k) {
                table[row][col] = table[row-1][col] + table[row-1][col-1]
                
            }
        }
    
    
    return table[n][k]
}
dynamicChooseK(10,3)
// T = o(nk)
// S = O(nk) we can improve the space complexity like we did with the fib problem we'll only need 2 rows and we can reusue the space
// S = O(k)




//: [Next](@next)

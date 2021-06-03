//: [Previous](@previous)

import Foundation




let intTree = TreeNode<Int>(7,7)
intTree.insert(root: intTree, value: 9, key: 9)
intTree.insert(root: intTree, value: 6, key: 6)
intTree.insert(root: intTree, value: 10, key: 10)
intTree.search(root: intTree, value: 10)
intTree.insert(root: intTree, value: 11, key: 11)
intTree.insert(root: intTree, value: 8, key: 8)
intTree.insert(root: intTree, value: 5, key: 5)
intTree.findMax(root: intTree)
intTree.findMin(root: intTree)
intTree.successor(root: intTree, p: TreeNode(5,5))
intTree.predecessor(root: intTree, p: TreeNode(9,9))

// rewatch the succ/pred and Delete vids one implementation is fixed

//: [Next](@next)

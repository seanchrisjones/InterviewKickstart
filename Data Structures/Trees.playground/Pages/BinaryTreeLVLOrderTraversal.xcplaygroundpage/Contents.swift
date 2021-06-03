import Cocoa

/*
 Given a binary Tree, return a Level order traversal of it's nodes
 IE: from left to right LVL by LVL
 **/

// Given Tree [3 ,9,20, nil, nil, 15, 7]


func bfs( root: BinaryNode<Int>) -> [[Int]]? {
    if root == nil {
        return nil
    }
    var q = QueueArray<BinaryNode<Int>>()
    q.push(root)
    var result = [[Int]]()
    while !q.isEmpty {
        var numNodes = q.count
        var temp = [Int]()
        
        repeat {
            while let node = q.pop() {
                temp.append(node.value)
                if node.leftChild != nil {
                    q.push(node.leftChild!)
                }
                if node.rightChild != nil {
                    q.push(node.rightChild!)
                }
                //print(temp)
                result.append(temp)
                numNodes -= 1
            }
            
        }while numNodes > 0
        
    }
    return result
}

func LOT(array: [Int]) {
    va
}

import Cocoa

/*
 SETS
 
 A set is a collection that holds unique values
 since sets enforce uniqueness they lend themselves to a variety of of applications such as finding duplicate elements in a collection of values .
 Similar to dicitonaries, values in a set have no notion of order.
 
 
 **/

let values: [String] = [...]
var bag: Set<String> = []
for value in values {
    if bag.contains(value){
        
    }
    bag.insert(value)
}

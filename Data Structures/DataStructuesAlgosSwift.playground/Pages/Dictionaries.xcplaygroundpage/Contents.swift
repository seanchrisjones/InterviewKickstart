//: [Previous](@previous)

import Foundation

/*
 DICTIONARIES
 
 A dictionary is another generic collection that holds key-value pairs
 Dictionaries do not have any guarantee of order
 You cannot insert at a specific index in a dictionary
 The Key in a didctionary must be hashable
 It is possible to traverse through a dictionary multiple times
 The order will not be defined and can change every time
 dictionaries do not need to worry about elements shifting
 Inserting into a dictionary takes a constant amount of time
 look up operations take a constant amount of time which is fater than finding a particular element in an array  which would have to check each element 
 **/

var scores: [String: Int] = ["Sean": 100, "Mark": 89, "Bob": 90]

// adding a new value to a dictionary
scores["Andrew"] = 75
//: [Next](@next)

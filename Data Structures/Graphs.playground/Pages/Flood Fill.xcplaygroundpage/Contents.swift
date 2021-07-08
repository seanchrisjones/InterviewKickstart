//: [Previous](@previous)

import Foundation

/*
 One pixel on a grayscale image changes color. Recolor all of the adjacent pixels of the same colot tot he same new color
 
 example { pixel_ row:0, pixel_column: 1, new_color: 2
 **/



func flood_fill(pixel_row: Int, pixel_column: Int, new_color: Int, image: [[Int]]) -> [[Int]] {
    guard image.count > 0 else { return [[Int]]() }
    var pic = image
    let rowLength = pic.count
    let colLength = pic[0].count
    BFS(pic: &pic, pixel_row: pixel_row, pixel_column: pixel_column, new_color: new_color, rowLength: rowLength, colLength: colLength)
    
    
    return pic
}

func BFS(pic: inout [[Int]], pixel_row: Int, pixel_column: Int, new_color: Int, rowLength: Int, colLength:Int) {
    var pixel = pic[pixel_row][pixel_column]
    print(pixel)
    let directions = [[1,0], [-1, 0], [0,1], [0, -1]]
    
    for direction in directions {
        let r = direction[0] + pixel[0]
        let c = direction[1] + pixel[1]
        
        if r < rowLength && r >= 0 && c >= 0 {
            pixel = new_color
            pic[r][c] = new_color
        }
    }
    
}

flood_fill(pixel_row: 0, pixel_column: 1, new_color: 2, image: [[0, 1, 3], [1, 1, 1], [1, 5, 4]])
//: [Next](@next)

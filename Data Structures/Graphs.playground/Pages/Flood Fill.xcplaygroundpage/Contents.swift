//: [Previous](@previous)

import Foundation

/*
 One pixel on a grayscale image changes color. Recolor all of the adjacent pixels of the same colot tot he same new color
 
 example { pixel_ row:0, pixel_column: 1, new_color: 2
 
 // we will need the outer loop for this problem because we're not just changing the adjacent pixels to the original but all the pixel adjacent to the adjacent pixels if they are the same.
 **/



func flood_fill(pixel_row: Int, pixel_column: Int, new_color: Int, image: [[Int]]) -> [[Int]] {
    guard image.count > 0 else { return [[Int]]() }
    var pic = image
    let rowLength = pic.count
    let colLength = pic[0].count
    var visited = Array(repeating: Array(repeating: false, count: colLength), count: rowLength)
    //print(visited)
    BFS(pic: &pic, pixel_row: pixel_row, pixel_column: pixel_column, new_color: new_color, rowLength: rowLength, colLength: colLength, visited: &visited)
    return pic
}







func BFS(pic: inout [[Int]], pixel_row: Int, pixel_column: Int, new_color: Int, rowLength: Int, colLength:Int, visited: inout [[Bool]]) {
    var pixel = pic[pixel_row][pixel_column]
    let directions = [[1,0], [-1, 0], [0,1], [0, -1]]
    for direction in directions {
                let r = direction[0] + pixel_row
                let c = direction[1] + pixel_column

        if r < rowLength && r >= 0 && c < colLength && c >= 0 {
            
        if  visited[r][c] == false {
                    visited[r][c] = true
                    if pic[r][c] == pixel {
                        
                        
                        BFS(pic: &pic, pixel_row: r, pixel_column: c, new_color: new_color, rowLength: rowLength, colLength: colLength, visited: &visited)

                        //pic[r][c] = new_color
                    }
                }
            }
    }
            pic[pixel_row][pixel_column] = new_color
        

    }


flood_fill(pixel_row: 0, pixel_column: 1, new_color: 2, image: [[0, 1, 3], [1, 1, 1], [1, 5, 4]])
//: [Next](@next)

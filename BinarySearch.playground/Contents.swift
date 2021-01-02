import UIKit

let numbers = [1,2,3,4,6,8,9,11,13,16,17,20]


/// O(n) = log(n)
// suitable for long arrays
func binarySearch(searchValue: Int, array: [Int]) -> Bool {
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        
        print("Middle value: \(middleValue), left index: \(leftIndex), right index: \(rightIndex), \(array[leftIndex]), \(array[rightIndex])")
        
        if middleValue == searchValue {
            return true
        }
        
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        
        if searchValue > middleValue {
            leftIndex = middleValue + 1
        }
    }
    
    return false
}


print(binarySearch(searchValue: 12, array: numbers))

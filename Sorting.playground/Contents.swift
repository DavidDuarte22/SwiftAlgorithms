import UIKit

// Bubble Sort
// Worst case: O(n^2)
func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
    // there is no need to sort the collection if it has less than two elements
    guard array.count >= 2 else { return }
    // A single-pass bubbles the largest value to the end of the collection.
    // Every pass needs to compare one less value than in the previous pass, so you essentially shorten the array by one with each pass.
    for end in (1..<array.count).reversed(){
        var swapped = false
        // this loop performs a single pass; it compares adjacent values and swaps them if needed.
        for current in 0..<end {
            if array[current] > array[current + 1]{
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        // if no values were swapped this pass, the collection must be sorted, and you can exit early
        if !swapped {
            return
        }
    }
}


// Selection Sort
func selectionSort<Element: Comparable>(_ array: inout [Element]) {
    // there is no need to sort the collection if it has less than two elements
    guard array.count >= 2 else { return }
    
    for current in 0..<(array.count - 1) {
        var lowest = current
        
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
            
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

// Insertion Sort : Only iterate once
func insertionSort<Element: Comparable>(_ array: inout [Element]) {
    // there is no need to sort the collection if it has less than two elements
    guard array.count > 1 else { return }

    for current in 1..<array.count {
        for shifting in (1...current).reversed() {
            if array[shifting] < array[shifting - 1]{
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
}

// Merge sort: Time: O(n log n) Space: O(n log n)
func mergeSort<Element: Comparable>(_ array: [Element]) -> [Element] {
    guard array.count > 1 else { return array }
    
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    
    return merge(left, right)
}

func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
    var leftIndex = 0
    var rightIndex = 0
    
    var result: [Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left [leftIndex]
        let rightElement = right[rightIndex]
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement  {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}

var testArray = [7, 2, 6, 3, 3, 9, 15, 4, 11]

var final = mergeSort(testArray)
print(final)

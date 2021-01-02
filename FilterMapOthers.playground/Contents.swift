import UIKit

let numbers = [1,2,3,4,3,3]

var filteredArray = [Int]()

for number in numbers {
    if number == 3 {
        filteredArray.append(number)
    }
}
filteredArray

let filtered = numbers.filter({return $0 == 3 })
filtered

let transformed = [1, 2, 3, 4].map({ return $0 * 3 })
transformed

var transformedArray = [Int]()
for number in [1, 2, 3, 4]{
    transformedArray.append(number * 2)
}
transformedArray


let sum = [1, 2, 3, 4].reduce(0, {sum, number in sum + number})
sum

var sumElements = 0
for number in [1, 2, 3, 4] {
    sumElements += number
}
sumElements

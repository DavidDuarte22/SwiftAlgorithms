import UIKit

func mostCommonWordInArray(array: [String]) -> String {
    
    var wordCountDict = [String: Int]()
    var mostCommonWord = String()
    
    for word in array {
        // if the word is in the array
        if let count = wordCountDict[word] {
            wordCountDict[word] = count + 1
        }
        // if not...
        else {
            wordCountDict[word] = 1
        }
    }
    
    for key in wordCountDict.keys {
        if mostCommonWord.isEmpty {
            mostCommonWord = key
        } else {
            if let count = wordCountDict[key],
               count > wordCountDict[mostCommonWord]! {
                mostCommonWord = key
            }
        }
    }
    
    return mostCommonWord
}


print(mostCommonWordInArray(array: ["Bob", "David", "Bob", "Martin", "David", "Matias", "Bob", "Andrea" ]))

import UIKit

// Tree advantages:
//  - Represent hierarchical relationships
//  - Manage sorted data
//  - Enable fast lookup operations
class Node {
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

// Making graph
let oneNode = Node(value: 1, leftChild: nil, rightChild: nil)
let fiveNode = Node(value: 5, leftChild: oneNode, rightChild: nil)

let elevenNode = Node(value: 11, leftChild: nil, rightChild: nil)
let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
let fourteenNode = Node(value: 14, leftChild: elevenNode, rightChild: twentyNode)

let tenNode = Node(value: 10, leftChild: fiveNode, rightChild: fourteenNode)

//          10
//         /  \
//        5   14
//       /   /  \
//      1   11  20

// Search function
func search(from node: Node?, searchValue: Int) -> Bool {
    if node?.value == nil {
        return false
    }
    if node?.value == searchValue {
        return true
    } else {
        return search(from: node?.leftChild, searchValue: searchValue) || search(from: node?.rightChild, searchValue: searchValue)
    }
}

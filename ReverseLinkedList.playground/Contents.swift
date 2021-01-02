import UIKit

class Node {
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

let threeNode = Node(value: 3, next: nil)
let twoNode = Node(value: 2, next: threeNode)
let oneNode = Node(value: 1, next: twoNode)

func printList(head: Node?) {
    print("Printing out list of nodes")
    var currentNode = head
    while currentNode != nil {
        print(currentNode?.value ?? -1)
        currentNode = currentNode?.next
    }
}

printList(head: oneNode)

func reverseList(head: Node?) -> Node? {
    
    var currentNode = head
    var prev: Node?
    var next: Node?
    
    while currentNode != nil { //1
        next = currentNode?.next //2 es el que sigue
        currentNode?.next = prev //nil
        prev = currentNode // 1
        currentNode = next
    }
    return prev
}

let myReverseList = reverseList(head: oneNode)

printList(head: myReverseList)

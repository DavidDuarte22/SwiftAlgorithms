import UIKit

class Node {
    let operation: String?
    let value: Float?
    var leftChild: Node?
    var rightChild: Node?
    
    init(operation: String?, value: Float?, leftChild: Node?, rightChild: Node?) {
        self.operation = operation
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

func evaluate(node: Node) -> Float {
    if node.value != nil {
        return node.value!
    }
    
    if node.operation == "+" {
        return evaluate(node: node.leftChild!) + evaluate(node: node.rightChild!)
    } else if node.operation == "*" {
        return evaluate(node: node.leftChild!) + evaluate(node: node.rightChild!)
    }
    
    return 0
}

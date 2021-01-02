import UIKit

// FIFO: First In , First Out
// Suitable for mantein de order

protocol Queue {
    associatedtype Element
    
    mutating func enqueue(_ element: Element)   // O(1)
    mutating func dequeue() -> Element?      // O(n)
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct QueueArray<T>: Queue {
    private var array: [T] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}



var queueArray = QueueArray<String>()

queueArray.enqueue("Pusheen")
queueArray.enqueue("Keyboard Cat")
queueArray.enqueue("Lil bub")
print(queueArray.peek)  // Pusheen
queueArray.dequeue()
queueArray.dequeue()
print(queueArray.peek)  // Lil Bub
queueArray.dequeue()
queueArray.isEmpty // True


struct QueueStack<T>: Queue {
    private var dequeueStack: [T] = []    // O(1)
    private var enqueueStack: [T] = []    // O(1)
    
    var isEmpty: Bool { return dequeueStack.isEmpty && enqueueStack.isEmpty }
    var peek: T? { return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}


var queueStack = QueueStack<String>()
queueStack.enqueue("Milo")
queueStack.enqueue("Sassy")
queueStack.enqueue("Ozma")
print(queueStack.peek)  // Milo
queueStack.dequeue()
queueStack.dequeue()
print(queueStack.peek)  // Ozma
queueStack.dequeue()
queueStack.isEmpty // True



/// CHALLENGE

protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

extension QueueStack: BoardGameManager {
    typealias Player = T
    
    mutating func nextPlayer() -> Player? {
        guard let player = dequeue() else {
            return nil
        }
        enqueue(player)
        return player
    }
}

var challengeQueue = QueueStack<String>()
challengeQueue.enqueue("Kirby")
challengeQueue.enqueue("Samus")
challengeQueue.enqueue("Pikachu")
challengeQueue.enqueue("Toon")
challengeQueue.peek // Kirby
challengeQueue.nextPlayer()
challengeQueue.nextPlayer()
challengeQueue.peek // Pikachu

